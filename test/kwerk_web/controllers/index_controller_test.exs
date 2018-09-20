defmodule KwerkWeb.Controllers.IndexControllerTest do

  use KwerkWeb.ConnCase

  describe "/" do
    test "Responds with success", %{conn: conn} do
      response =
        conn
        |> get(index_path(conn, :index))
        |> json_response(200)

      assert response === %{"health" => "ok"}
    end
  end
end
