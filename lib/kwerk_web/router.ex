defmodule KwerkWeb.Router do
  use KwerkWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", KwerkWeb do
    pipe_through :api

    get "/", IndexController, :index
  end

  scope "/api", KwerkWeb do
    pipe_through :api
  end
end
