defmodule GeolocationApiWeb.Router do
  use GeolocationApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", GeolocationApiWeb do
    pipe_through :api
    get("/", HeartbeatController, :heartbeat)
  end

  scope "/api", GeolocationApiWeb do
    pipe_through :api
  end
end
