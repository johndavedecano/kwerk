defmodule Kwerk.Account.UserActionsTest do
  use Kwerk.DataCase

  alias Kwerk.Account.UserActions

  import Kwerk.Factory

  describe "UserActions.create_user" do
    test "with validation error" do
      {:error, changeset} = UserActions.create_user(%{})
      refute changeset.valid?
    end

    test "create user with success" do
      country = insert(:country)

      valid_attrs = %{
        name: "John Dave Decano",
        email: "test123@gmail.com",
        password: "password",
        password_confirmation: "password",
        role: "admin",
        country_id: country.id,
        status: "active"
      }

      {:ok, user} = UserActions.create_user(valid_attrs)

      assert user.name === "John Dave Decano"
      assert user.status === "active"
      assert user.email === "test123@gmail.com"
    end
  end

  describe "update user" do
    test "update user with success" do
      user = insert(:user)
      {:ok, result} = UserActions.update_user(user, %{name: "Test"})
      assert result.name === "Test"
    end

    test "update user with validation error" do
      user = insert(:user)
      {:error, changeset} = UserActions.update_user(user, %{name: ""})
      refute changeset.valid?
    end

    test "update user with validate error invalid status" do
      user = insert(:user)
      {:error, changeset} = UserActions.update_user(user, %{name: "Test", status: "test"})
      refute changeset.valid?
    end
  end

  describe "delete user" do
    test "update user with success" do
      user = insert(:user)
      {:ok, result} = UserActions.delete_user(user.id)
      assert result.status === "deleted"
    end

    test "update user with error" do
      assert_raise(Ecto.NoResultsError, (fn ->  UserActions.delete_user(545) end))
    end
  end
end
