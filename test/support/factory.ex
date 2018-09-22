defmodule Kwerk.Factory do
  # with Ecto
  use ExMachina.Ecto, repo: Kwerk.Repo
  # # without Ecto
  # use ExMachina

  alias Kwerk.Posting.Category
  alias Kwerk.Posting.Feature
  # alias Kwerk.Posting.Post
  alias Kwerk.Common.Country
  alias Kwerk.Account.User

  def user_factory do
    %User{
      name: sequence("John Dave Decano"),
      email: sequence(:email, &"johndavedecano#{&1}@gmail.com"),
      avatar: %{},
      password_hash: Comeonin.Pbkdf2.hashpwsalt("password"),
      address: sequence("144-3 West Bank Floodway Maybunga"),
      city: sequence("Pasig"),
      state: sequence("Metro Manila"),
      status: "active",
      role: "user",
      country: build(:country)
    }
  end

  def make_admin(user) do
    %{user | role: "admin"}
  end

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
