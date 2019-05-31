defmodule GeolocationApi.Factory do
  alias GeolocationHandler.Geolocations.Geolocation
  use ExMachina.Ecto, repo: GeolocationApi.Repo

  def geolocation_factory do
    %Geolocation{
      ip_address: Faker.Internet.ip_v4_address(),
      country_code: Faker.Address.country_code(),
      country: Faker.Address.country(),
      city: Faker.Address.city(),
      latitude: Faker.Address.latitude(),
      longitude: Faker.Address.longitude(),
      mystery_value: Enum.random(1_000_000..9_999_999)
    }
  end
end
