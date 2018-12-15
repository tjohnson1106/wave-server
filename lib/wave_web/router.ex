defmodule WaveWeb.Router do
  use WaveWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", WaveWeb do
    pipe_through :api
  end
end
