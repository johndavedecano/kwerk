defmodule KwerkWeb.IndexView do

  use KwerkWeb, :view

  def render("index.json", _) do
    %{
      health: "ok",
    }
  end
end
