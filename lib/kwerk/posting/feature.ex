defmodule Kwerk.Posting.Feature do
  use Ecto.Schema
  import Ecto.Changeset


  schema "features" do

    timestamps()
  end

  @doc false
  def changeset(feature, attrs) do
    feature
    |> cast(attrs, [])
    |> validate_required([])
  end
end
