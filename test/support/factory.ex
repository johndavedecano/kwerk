defmodule Kwerk.Factory do
  # with Ecto
  use ExMachina.Ecto, repo: Kwerk.Repo
  # # without Ecto
  # use ExMachina

  alias Kwerk.Posting.Category
  # alias Kwerk.Posting.Feature
  # alias Kwerk.Posting.Post

  @doc false
  def category_factory do
    %Category{
      name: sequence("Category"),
      status: sequence(:status, ["active", "inactive", "deleted"])
    }
  end
end
