defmodule LiveK8sNode.Application do
  @moduledoc false

  use Application

  ## Callbacks

  @impl true
  def start(_type, _args) do
    topologies = Application.get_env(:libcluster, :topologies)
    myself = Node.self()

    children = [
      {Cluster.Supervisor, [topologies, [name: LiveK8sNode.ClusterSupervisor]]},
      {Phoenix.PubSub, name: LiveK8s.PubSub},
      {Task, fn -> say_hi(myself) end}
    ]

    opts = [strategy: :one_for_one, name: LiveK8sNode.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # TODO: Save the nodes_topic on persistent_term
  defp say_hi(node) do
    Phoenix.PubSub.broadcast(LiveK8s.PubSub, "nodes_topic", {:new_node, node})
  end
end
