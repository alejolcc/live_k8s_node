defmodule LiveK8sNode.MixProject do
  use Mix.Project

  def project do
    [
      app: :live_k8s_node,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :phoenix_pubsub],
      mod: {LiveK8sNode.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:libcluster, "~> 3.3"},
      {:phoenix_pubsub, "~> 2.0"}
    ]
  end
end
