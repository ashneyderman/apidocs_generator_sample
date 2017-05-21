defmodule ApidocsGeneratorSample.Router do
  use ApidocsGeneratorSample.Web, :router

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

  scope "/api", ApidocsGeneratorSample do
    pipe_through :api

    get  "/simple", SimpleController, :index
    post "/simple", SimpleController, :post
  end

end
