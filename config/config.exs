# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :kwerk,
  ecto_repos: [Kwerk.Repo]

# Configures the endpoint
config :kwerk, KwerkWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "4/TY5e7zdItZqHkxp7wPDKJoZO5SsrHjrSmB+PE2s99A55J/Tq0d4Yd2U7LtLacG",
  render_errors: [view: KwerkWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Kwerk.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Third party configs
config :pbkdf2_elixir, rounds: 1
config :kwerk, Kwerk.Guardian,
  issuer: "kwerk",
  secret_key: "N1FdL2JJe+2GCojYCvuHHfoXStnD+EJwxFcLgnKjhSK9asr0w23eJXKnLaUiF9or"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
