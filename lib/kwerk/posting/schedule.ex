defmodule Kwerk.Posting.PostSchedule do
  use Ecto.Schema
  import Ecto.Changeset

  schema "schedules" do
    timestamps()
  end

  @doc false
  def changeset(post_schedule, attrs) do
    post_schedule
    |> cast(attrs, [])
    |> validate_required([])
  end
end
