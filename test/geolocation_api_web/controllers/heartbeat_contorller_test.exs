defmodule GeolocationApiWeb.HeartbeatControllerTest do
  use GeolocationApiWeb.ConnCase

  test "heartbeat works 200", %{conn: conn} do
    assert get(conn, Routes.heartbeat_path(conn, :heartbeat))
           |> json_response(200)
  end
end
