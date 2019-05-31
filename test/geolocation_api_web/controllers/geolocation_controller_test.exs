defmodule GeolocationApiWeb.GeolocationControllerTest do
  use GeolocationApiWeb.ConnCase

  test "show geolocation data valid returns ok", %{conn: conn} do
    geolocation = insert(:geolocation)

    assert get(conn, Routes.geolocation_path(conn, :show, geolocation.ip_address))
           |> json_response(200) == %{
             "city" => geolocation.city,
             "country" => geolocation.country,
             "ip_address" => geolocation.ip_address,
             "country_code" => geolocation.country_code,
             "latitude" => geolocation.latitude,
             "longitude" => geolocation.longitude,
             "mystery_value" => geolocation.mystery_value
           }
  end

  test "show geolocation unexisting data returns 404", %{conn: conn} do
    assert get(conn, Routes.geolocation_path(conn, :show, "random_string"))
           |> json_response(404)
  end
end
