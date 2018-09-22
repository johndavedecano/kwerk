defmodule Kwerk.Repo.Migrations.AddPostsSchedulesTable do
  use Ecto.Migration

  def up do
    create table(:schedules) do
      add :post_id, references("posts")
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
    drop table(:schedules)
  end
end
