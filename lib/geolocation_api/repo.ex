defmodule GeolocationApi.Repo do
  use Ecto.Repo,
    otp_app: :geolocation_api,
    adapter: Ecto.Adapters.Postgres
end
