# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :flux_api_gateway,
  ecto_repos: [FluxApiGateway.Repo]

# Configures the endpoint
config :flux_api_gateway, FluxApiGatewayWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "wsfyb/T8majOkB46Mz+ofd/aQHMG87j52O6jO4L2Z86UoD8pgTQMa8hxcwICEgbd",
  render_errors: [view: FluxApiGatewayWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: FluxApiGateway.PubSub,
  live_view: [signing_salt: "pfpEPnbZ"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
