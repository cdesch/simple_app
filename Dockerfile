ARG MIX_ENV="dev"

FROM cdesch/elixir-base:1.13-alpine AS base

FROM base AS builder

ARG MIX_ENV
ENV MIX_ENV="${MIX_ENV}"

COPY mix.exs .
COPY mix.lock .

CMD mix deps.get && mix phx.server
