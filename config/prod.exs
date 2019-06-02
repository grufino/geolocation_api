use Mix.Config

config :geolocation_api, GeolocationApiWeb.Endpoint,
  http: [:inet6, port: {:system, "PORT", required: true}],
  server: true,
  debug_errors: false,
  url: [host: {:system, "HOST", required: true}, port: {:system, "PORT", required: true}],
  secret_key_base: "kQ+SszXoHKzyEwk8VOaHiaqlv+NUzllcAvCoHbYiaLE+k7pQIfQUhpVu2o4O3mB3"

# Configure Database
config :geolocation_api, GeolocationApi.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: {:system, "DB_URL", required: true},
  pool_size: 15,
  timeout: 15_000,
  ssl: true
