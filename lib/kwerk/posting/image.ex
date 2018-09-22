defmodule Kwerk.Posting.PostImage do
  use Ecto.Schema
  import Ecto.Changeset

  alias Kwerk.Posting.Post

  schema "images" do
    field :files, :map
    belongs_to(:country, Post, foreign_key: :post_id)
    timestamps()
  end

  @doc false
  def changeset(image, attrs) do
    image
    |> cast(attrs, [:files, :post_id])
    |> validate_required([:files, :post_id])
  end
end
