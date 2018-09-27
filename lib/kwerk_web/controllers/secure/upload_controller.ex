defmodule KwerkWeb.Secure.UploadController do
  use KwerkWeb, :controller

  alias Kwerk.Image;

  def create(conn, %{"file" => file}) do

    IO.inspect Image.store(file)

    conn |> put_status(201) |> json(file)
  end
end
