defmodule GeolocationApiWeb.HeartbeatController do
  use GeolocationApiWeb, :controller

  def heartbeat(conn, _params) do
    conn
    |> put_status(:ok)
    |> json(%{status: "Geolocation Api is alive! Send me some requests!"})
  end
end
