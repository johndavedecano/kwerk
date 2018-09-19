defmodule Kwerk.Common.Country do
  use Ecto.Schema
  import Ecto.Changeset


  schema "countries" do

    timestamps()
  end

  @doc false
  def changeset(country, attrs) do
    country
    |> cast(attrs, [])
    |> validate_required([])
  end
end
