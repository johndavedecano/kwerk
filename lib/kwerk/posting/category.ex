defmodule Kwerk.Posting.Category do
  use Ecto.Schema
  import Ecto.Changeset


  schema "categories" do

    timestamps()
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, [])
    |> validate_required([])
  end
end
