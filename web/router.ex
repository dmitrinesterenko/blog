defmodule BlogPhoenix.Router do
  use BlogPhoenix.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", BlogPhoenix do
    pipe_through :browser # Use the default browser stack

    get "/", ReaderController, :index
    get "/read", ReaderController, :index
    get "/about", PageController, :about
    get "/write", WriterController, :new
    post "/write", WriterController, :create
    get "/write/:post_id", WriterController, :edit
    put "/write/:post_id", WriterController, :save
  end

  # Other scopes may use custom stacks.
  # scope "/api", BlogPhoenix do
  #   pipe_through :api
  # end
end
