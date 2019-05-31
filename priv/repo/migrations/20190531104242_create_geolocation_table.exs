defmodule GeolocationApi.Repo.Migrations.CreateGeolocationTable do
  use Ecto.Migration

  def up do
    create table(:geolocations, primary_key: false) do
      add(:ip_address, :string, primary_key: true)
      add(:country_code, :string)
      add(:country, :string)
      add(:city, :string)
      add(:latitude, :float)
      add(:longitude, :float)
      add(:mystery_value, :bigint)
    end
  end

  def down do
    drop_if_exists table(:geolocations)
  end
end
