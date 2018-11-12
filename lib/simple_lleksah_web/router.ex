defmodule SimpleLleksahWeb.Router do
  use SimpleLleksahWeb, :router

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

  # difine as pipeline, use as pipe_through
  pipeline :authenticated do
    plug SimpleLleksah.Guardian.AuthPipeline
  end

  scope "/", SimpleLleksahWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api/v1", SimpleLleksahWeb do
    pipe_through :api
    post "/sign_in", SessionController, :sign_in

    # difine as pipeline, use as pipe_through
    pipe_through :authenticated
    # refer:
    # https://elixirforum.com/t/use-only-instead-of-except-when-generating-api-routes/8320
    resources "/users", UserController, except: [:new, :edit]
  end
end
