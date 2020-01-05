FROM bitwalker/alpine-elixir-phoenix:1.9.1 as releaser

WORKDIR /app

# Install Hex + Rebar
RUN mix do local.hex --force, local.rebar --force

COPY config/ /app/config/
COPY mix.exs /app/
COPY mix.* /app/

COPY apps/talks_game/mix.exs /app/apps/talks_game/
COPY apps/talks_game_web/mix.exs /app/apps/talks_game_web/

ENV MIX_ENV=prod
RUN mix do deps.get --only $MIX_ENV, deps.compile

COPY . /app/


WORKDIR /app/apps/talks_game_web
RUN MIX_ENV=prod mix compile
# RUN npm install --prefix ./assets
# RUN npm run deploy --prefix ./assets
# RUN mix phx.digest

WORKDIR /app
RUN MIX_ENV=prod mix release

########################################################################

FROM bitwalker/alpine-elixir-phoenix:1.9.1

EXPOSE 4000
ENV PORT=4000 \
  MIX_ENV=prod \
  SHELL=/bin/bash

WORKDIR /app
COPY --from=releaser app/_build/prod/rel/talks_game_umbrella/ .
# COPY --from=releaser app/bin/ ./bin
# CMD ["ls bin"]
CMD ["./bin/talks_game_umbrella","start"]