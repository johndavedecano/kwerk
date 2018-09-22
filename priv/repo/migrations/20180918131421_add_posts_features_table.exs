defmodule Kwerk.Repo.Migrations.AddPostsFeaturesTable do
  use Ecto.Migration

  def up do
    create table(:posts_features) do
      add :post_id, references("posts")
      add :feature_id, references("features")
    end
  end

  def down do
    drop table(:posts_features)
  end
end
