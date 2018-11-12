# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :simple_lleksah,
  ecto_repos: [SimpleLleksah.Repo]

# Configures the endpoint
config :simple_lleksah, SimpleLleksahWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "GGB3MGChbuvPoCj0VQv/SrBKHYH99nSv0wfncWUr3mv/McppiTQFzSfvO2Ydd9Dp",
  render_errors: [view: SimpleLleksahWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: SimpleLleksah.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Configures Guardian secret key
config :simple_lleksah, SimpleLleksah.Guardian,
  issuer: "simple_lleksah",
  secret_key: "YLNnO3CV2XFAVNNN/X3D3EFt93dsIJht/Lun9RfhwVHm8Ewus+0AsvOrKsYCXna2"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
