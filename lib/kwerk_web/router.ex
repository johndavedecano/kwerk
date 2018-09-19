defmodule KwerkWeb.Router do
  use KwerkWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", KwerkWeb do
    pipe_through :api
  end
end
