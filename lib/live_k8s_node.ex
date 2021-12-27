defmodule LiveK8sNode do
  @moduledoc """
  Documentation for `LiveK8sNode`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> LiveK8sNode.hello()
      :world

  """
  def send_n(n) do
    Enum.each(1..n, & send(&1))
  end

  def send(n) do
    event = %{number: n, from: "#{Node.self}"}
    Phoenix.PubSub.broadcast(LiveK8s.PubSub, "user:123", {:event, event})
  end
end
