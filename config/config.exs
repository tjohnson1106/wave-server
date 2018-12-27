use Mix.Config

# General application configuration
config :wave,
  ecto_repos: [Wave.Repo]

# Configures the endpoint
config :wave, WaveWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "NsklDpafzC5CKezxxTWMBIp/bPRvpV4sdPg2U7SuoFo7xUurJA4DglfGa83I1sWZ",
  render_errors: [view: WaveWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Wave.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Configures Guardian
config :wave, WaveWeb.Auth.Guardian,
  issuer: "wave",
  verify_issuer: true,
  secret_key: "+pi0pTxKc3crpkEn8fq8IX7xIUV0lSpWjbpHKggdA3QzGjUEbjS9FGJdILyuxDx4"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
