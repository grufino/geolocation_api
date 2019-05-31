use Mix.Config

config :geolocation_api, GeolocationApiWeb.Endpoint,
  http: [:inet6, port: 4001],
  server: true,
  debug_errors: false,
  url: [port: 4000],
  secret_key_base: "kQ+SszXoHKzyEwk8VOaHiaqlv+NUzllcAvCoHbYiaLE+k7pQIfQUhpVu2o4O3mB3",
  cache_static_manifest: "priv/static/cache_manifest.json"

# Configure Database
config :geolocation_api, GeolocationApi.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: System.get_env("DATABASE_URL") || "ecto://postgres:postgres@postgres/postgres",
  pool_size: 15,
  pool_timeout: 15_000,
  timeout: 15_000
