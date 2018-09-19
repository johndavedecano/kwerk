defmodule Kwerk.Repo.Migrations.AddCategoriesTable do
  use Ecto.Migration

  def up do
    create table(:categories) do
      add :name, :string
      add :status, :string, default: "active"
      timestamps()
    end
  end

  def down do
    drop table(:categories)
  end
end
