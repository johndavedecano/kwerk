defmodule Kwerk.Repo.Migrations.AddPostsFeaturesTable do
  use Ecto.Migration

  def up do
    create table(:posts_features) do
      add :posts_id, references("posts")
      add :features_id, references("features")
    end
  end

  def down do
    drop table(:posts_features)
  end
end
