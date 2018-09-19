defmodule Kwerk.Repo.Migrations.AddPostsImagesTable do
  use Ecto.Migration

  def up do
    create table(:posts_images) do
      add :posts_id, references("posts")
      add :files, :json
    end
  end

  def down do
    drop table(:posts_images)
  end
end
