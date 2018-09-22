defmodule Kwerk.Account.UserTest do
  use Kwerk.DataCase

  alias Kwerk.Account.User

  import Kwerk.Factory

  test "changeset with invalid attributes" do
    country = insert(:country)
    changeset = User.changeset(%User{}, %{
      name: "John Dave Decano",
      email: "johndavedecano@gmail.com",
      password: "",
      country_id: country.id
    })
    refute changeset.valid?
  end

  test "changeset with valid attributes" do
    country = insert(:country)
    changeset = User.changeset(%User{}, %{
      name: "John Dave Decano",
      email: "johndavedecano@gmail.com",
      password: "password",
      password_confirmation: "password",
      country_id: country.id
    })
    changes = changeset.changes
    assert changeset.valid?
    assert changes.email === "johndavedecano@gmail.com"
    assert changes.password === "password"
    assert changes.name === "John Dave Decano"
  end
end
