defmodule Kwerk.Repo.Migrations.AddUsersTable do
  use Ecto.Migration

  def up do
    create table(:users) do
      add :name, :string
      add :email, :string
      add :avatar, :json
      add :password_hash, :string
      add :address, :string
      add :city, :string
      add :state, :string
      add :countries_id, references("countries")
      add :lon, :string
      add :lat, :string
      add :status, :string, default: "inactive"
      add :role, :string, default: "user"
      add :reset_code, :string
      add :reset_code_expiration, :integer
      add :activation_code, :string
      add :activation_code_expiration, :integer
      timestamps()
    end

    create index(:users, [:countries_id])
    create index(:users, [:status])
    create index(:users, [:role])
    unique_index(:users, [:email])
  end

  def down do
    drop table(:users)
    drop index(:users, [:countries_id])
    drop index(:users, [:status])
    drop index(:users, [:role])
    drop index(:users, [:email])
  end
end
