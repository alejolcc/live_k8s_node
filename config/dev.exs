import Config

config :libcluster,
  topologies: [
    live_k8s_node: [
      strategy: Cluster.Strategy.Gossip
    ]
  ]
