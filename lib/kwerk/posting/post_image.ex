defmodule Kwerk.Posting.PostImage do
  use Ecto.Schema
  import Ecto.Changeset


  schema "posts_images" do

    timestamps()
  end

  @doc false
  def changeset(post_image, attrs) do
    post_image
    |> cast(attrs, [])
    |> validate_required([])
  end
end
