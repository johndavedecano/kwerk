defmodule Kwerk.Repo.Migrations.AddPostsImagesTable do
  use Ecto.Migration

  def up do
    create table(:images) do
      add :posts_id, references("posts")
      add :files, :json
    end
  end

  def down do
    drop table(:images)
  end
end
