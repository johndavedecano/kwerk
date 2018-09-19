defmodule Kwerk.Repo.Migrations.AddPostsTable do
  use Ecto.Migration

  def up do
    create table(:posts) do

      add :users_id, references("users")
      add :categories_id, references("categories")
      add :countries_id, references("countries")

      add :title, :string
      add :description, :string
      add :policies, :string
      add :email, :string
      add :thumbnail, :json
      add :cover, :json
      add :max_occupants, :integer
      add :payment_type, :string, default: "monthly"
      add :payment_amount, :float, default: 0

      # LOCATION
      add :address, :string
      add :city, :string
      add :state, :string
      add :lon, :string
      add :lat, :string

      add :status, :string, default: "inactive"

      timestamps()
    end

    create index(:posts, [:users_id])
    create index(:posts, [:title])
    create index(:posts, [:city])
    create index(:posts, [:state])
    create index(:posts, [:countries_id])
    create index(:posts, [:categories_id])
    create index(:posts, [:payment_type])
    create index(:posts, [:payment_amount])
    create index(:posts, [:status])
  end

  def down do
    drop table(:posts)
    drop index(:posts, [:users_id])
    drop index(:posts, [:title])
    drop index(:posts, [:city])
    drop index(:posts, [:state])
    drop index(:posts, [:countries_id])
    drop index(:posts, [:categories_id])
    drop index(:posts, [:payment_type])
    drop index(:posts, [:payment_amount])
    drop index(:posts, [:status])
  end
end
