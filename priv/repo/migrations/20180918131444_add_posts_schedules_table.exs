defmodule Kwerk.Repo.Migrations.AddPostsSchedulesTable do
  use Ecto.Migration

  def up do
    create table(:posts_schedules) do
      add :posts_id, references("posts")
      add :mon, :boolean, default: false
      add :tue, :boolean, default: false
      add :wed, :boolean, default: false
      add :thu, :boolean, default: false
      add :fri, :boolean, default: false
      add :sat, :boolean, default: false
      add :sun, :boolean, default: false
    end
  end

  def down do
    drop table(:posts_schedules)
  end
end
