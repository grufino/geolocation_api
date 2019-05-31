defmodule GeolocationApiWeb.Router do
  use GeolocationApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", GeolocationApiWeb do
    get("/", HeartbeatController, :heartbeat)
  end

  scope "/api", GeolocationApiWeb do
    pipe_through :api
    get("/geolocation/:ip_address", GeolocationController, :show)
  end
end
