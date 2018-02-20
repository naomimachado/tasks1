# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :task1,
  ecto_repos: [Task1.Repo]

# Configures the endpoint
config :task1, Task1Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "6ixmtgBSL/hHTfkmcw8EARocMumZKj/lnNGYUu7tmmLGJ+cRf5CvFdelEcdIpf7Q",
  render_errors: [view: Task1Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Task1.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
