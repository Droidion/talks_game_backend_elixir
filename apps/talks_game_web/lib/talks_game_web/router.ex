defmodule TalksGameWeb.Router do
  use TalksGameWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api" do
    pipe_through :api

    forward "/graphiql", Absinthe.Plug.GraphiQL, schema: TalksGameWeb.Schema

    forward "/", Absinthe.Plug, schema: TalksGameWeb.Schema
  end

  pipeline :browser do
    plug(:accepts, ["html"])
  end

  scope "/", TalksGameWeb do
    pipe_through :browser
    get "/", DefaultController, :index
  end
end
