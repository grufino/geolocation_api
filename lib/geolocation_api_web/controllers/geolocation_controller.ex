defmodule GeolocationApiWeb.GeolocationController do
  use GeolocationApiWeb, :controller

  alias GeolocationHandler.Geolocations
  alias GeolocationHandler.Geolocations.Geolocation
  alias GeolocationApi.Repo

  def show(conn, %{"ip_address" => ip_address}) do
    with %Geolocation{} = geolocation <- Geolocations.get_geolocation_by_ip(ip_address, Repo) do
      conn
      |> put_status(:ok)
      |> json(geolocation)
    else
      nil ->
        conn
        |> put_status(:not_found)
        |> json(%{status: "No Geolocation found with this ip address"})
    end
  end
end
