defmodule Kwerk.Common.Country do
  use Ecto.Schema
  import Ecto.Changeset


  schema "countries" do
    field :name, :string
    field :code, :string, unique: true
    timestamps()
  end

  @doc false
  def changeset(country, attrs) do
    country
    |> cast(attrs, [:name, :code])
    |> validate_required([:name, :code])
    |> unique_constraint(:code)
  end
end
