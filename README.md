# Live_k8s_node
Demo project to play around Erlang distribution, k8s & broadway

The idea is to have one node that act as Server from
https://github.com/alejolcc/live_k8s

And this one a node that act as dummy client that send events via PubSub

# Running

Start the server & client using sname command 
```
iex --sname server -S mix phx.servr
```
Start the node 
```
iex --sname client -S mix
```
# Endpoints

To see the connected nodes you can visit

http://localhost:4000/nodes

To see the dashboard nodes you can visit

http://localhost:4000/dashboard
