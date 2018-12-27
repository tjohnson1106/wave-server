defmodule WaveWeb.Router do
  use WaveWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
    plug(WaveWeb.Context)
  end

  scope "/api" do
    pipe_through(:api)

    forward("/graphql", Absinthe.Plug, schema: WaveWeb.Schema)

    if Mix.env() == :dev do
      forward("/graphiql", Absinthe.Plug.GraphiQL, schema: WaveWeb.Schema)
    end
  end
end
