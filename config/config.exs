# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :wedding,
  ecto_repos: [Wedding.Repo]

# Configures the endpoint
config :wedding, Wedding.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Vi9Gicp76otcSc48g8rtbjg4412Z2Mitz26gg3RvsrfEBGJ9a7aQ93sxr2PfwmG/",
  render_errors: [view: Wedding.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Wedding.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
