defmodule HomeListWeb.Router do
  use HomeListWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", HomeListWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/api" do
    pipe_through :api

    get "/", Absinthe.Plug.GraphiQL, schema: HomeListWeb.Api.Schema, interface: :playground
    post "/", Absinthe.Plug, schema: HomeListWeb.Api.Schema
  end

  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: HomeListWeb.Telemetry
    end
  end
end
