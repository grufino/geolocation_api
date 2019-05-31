use Mix.Config

# Configure your database
config :geolocation_api, GeolocationApi.Repo,
  username: "postgres",
  password: "postgres",
  database: "geolocation_api_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :geolocation_api, GeolocationApiWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
