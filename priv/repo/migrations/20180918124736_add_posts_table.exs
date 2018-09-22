defmodule Kwerk.Repo.Migrations.AddPostsTable do
  use Ecto.Migration

  def up do
    create table(:posts) do

      add :user_id, references("users")
      add :category_id, references("categories")
      add :country_id, references("countries")

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

    create index(:posts, [:user_id])
    create index(:posts, [:title])
    create index(:posts, [:city])
    create index(:posts, [:state])
    create index(:posts, [:country_id])
    create index(:posts, [:category_id])
    create index(:posts, [:payment_type])
    create index(:posts, [:payment_amount])
    create index(:posts, [:status])
  end

  def down do
    drop table(:posts)
    drop index(:posts, [:user_id])
    drop index(:posts, [:title])
    drop index(:posts, [:city])
    drop index(:posts, [:state])
    drop index(:posts, [:country_id])
    drop index(:posts, [:category_id])
    drop index(:posts, [:payment_type])
    drop index(:posts, [:payment_amount])
    drop index(:posts, [:status])
  end
end
