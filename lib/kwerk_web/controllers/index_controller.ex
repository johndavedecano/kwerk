defmodule KwerkWeb.IndexController do
  use KwerkWeb, :controller

  def index(conn, _) do
    render conn, "index.json"
  end
end
