# ./Dockerfile
FROM elixir:1.12.3 AS builder
ENV MIX_ENV=prod
WORKDIR /usr/local/live_k8s_node
# Copies our app source code into the build container
COPY . .
# Compile Elixir
RUN mix local.hex --force
RUN mix do deps.get, deps.compile, compile
# Build Release
RUN mkdir -p /opt/release \
    && mix release \
    && mv _build/${MIX_ENV}/rel/live_k8s_node /opt/release
# Create the runtime container
FROM erlang:24.1.3 as runtime
WORKDIR /usr/local/live_k8s_node
COPY --from=builder /opt/release/live_k8s_node .
CMD [ "bin/live_k8s_node", "start" ]
# HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=2 \
#  CMD nc -vz -w 2 localhost 4000 || exit 1