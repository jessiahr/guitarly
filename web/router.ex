defmodule Guitarly.Router do
  use Guitarly.Web, :router

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

  scope "/", Guitarly do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api", Guitarly do
    pipe_through :api

    resources "/exercises", ExerciseController, except: [:new, :edit]
  end
end
