defmodule Kwerk.Repo.Migrations.AddFeaturesTable do
  use Ecto.Migration

  def up do
    create table(:features) do
      add :name, :string
      add :status, :string, default: "active"
      timestamps()
    end
  end

  def down do
    drop table(:features)
  end
end
