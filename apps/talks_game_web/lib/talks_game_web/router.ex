defmodule TalksGameWeb.Router do
  use TalksGameWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", TalksGameWeb do
    pipe_through :api
  end

  pipeline :browser do
    plug(:accepts, ["html"])
  end

  scope "/", TalksGameWeb do
    pipe_through :browser
    get "/", DefaultController, :index
  end
end
