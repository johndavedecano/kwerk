defmodule Kwerk.Posting.Category do
  use Ecto.Schema
  import Ecto.Changeset

  schema "categories" do
    field :name, :string
    field :status, :string, unique: true
    timestamps()
  end

  @doc false
  def changeset(feature, attrs) do
    feature
    |> cast(attrs, [:name, :status])
    |> validate_required([:name, :status])
    |> validate_inclusion(:status, ["active", "deleted", "inactive"])
    |> unique_constraint(:name)
  end
end
