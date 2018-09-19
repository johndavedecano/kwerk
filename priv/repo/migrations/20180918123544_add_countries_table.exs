defmodule Kwerk.Repo.Migrations.AddCountriesTable do
  use Ecto.Migration

  def up do
    create table(:countries) do
      add :name, :string
      add :code, :string
      timestamps()
    end
  end

  def down do
    drop table(:countries)
  end
end
