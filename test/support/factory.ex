defmodule Kwerk.Factory do
  # with Ecto
  use ExMachina.Ecto, repo: Kwerk.Repo
  # # without Ecto
  # use ExMachina

  alias Kwerk.Posting.Category
  alias Kwerk.Posting.Feature
  # alias Kwerk.Posting.Post
  alias Kwerk.Common.Country


  def country_factory do
    %Country{
      name: sequence("Philippines"),
      code: sequence("PH")
    }
  end

  @doc false
  def category_factory do
    %Category{
      name: sequence("Category"),
      status: sequence(:status, ["active", "inactive", "deleted"])
    }
  end

   @doc false
   def feature_factory do
    %Feature{
      name: sequence("Feature"),
      status: sequence(:status, ["active", "inactive", "deleted"])
    }
  end
end
