# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :wave,
  ecto_repos: [Wave.Repo]

# Configures the endpoint
config :wave, WaveWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "NsklDpafzC5CKezxxTWMBIp/bPRvpV4sdPg2U7SuoFo7xUurJA4DglfGa83I1sWZ",
  render_errors: [view: WaveWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Wave.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
