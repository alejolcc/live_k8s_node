config :libcluster,
  topologies: [
    live_k8s_node: [
      strategy: Elixir.Cluster.Strategy.Kubernetes.DNS,
      config: [
        service: "live-k8s-nodes",
        application_name: "live_k8s"
      ]
    ]
  ]
