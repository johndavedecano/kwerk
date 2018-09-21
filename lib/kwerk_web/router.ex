defmodule KwerkWeb.Router do
  use KwerkWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", KwerkWeb do
    pipe_through :api
    get "/", IndexController, :index
  end

  scope "/api/auth", KwerkWeb.Auth do
    pipe_through :api
  end

  scope "/api/admin", KwerkWeb.Admin do
    pipe_through :api
  end

  scope "/api/secure", KwerkWeb.Secure do
    pipe_through :api
  end

  scope "/api/global", KwerkWeb.Global do
    pipe_through :api
  end
end
