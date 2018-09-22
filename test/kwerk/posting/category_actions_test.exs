defmodule Kwerk.Posting.CategoryActionsTest do
  use Kwerk.DataCase

  alias Kwerk.Posting.CategoryActions

  import Kwerk.Factory

  describe "create category" do
    test "create category with validation error" do
      {:error, changeset} = CategoryActions.create_category(%{})
      refute changeset.valid?
    end

    test "create category with success" do
      {:ok, category} = CategoryActions.create_category(%{name: "Office", status: "active"})
      assert category.name === "Office"
      assert category.status === "active"
    end
  end

  describe "update category" do
    test "update category with success" do
      category = insert(:category)
      {:ok, result} = CategoryActions.update_category(category, %{name: "Test", status: "active"})
      assert result.name === "Test"
      assert result.status === "active"
    end

    test "update category with validation error" do
      category = insert(:category)
      {:error, changeset} = CategoryActions.update_category(category, %{name: ""})
      refute changeset.valid?
    end

    test "update category with validate error invalid status" do
      category = insert(:category)
      {:error, changeset} = CategoryActions.update_category(category, %{name: "Test", status: "test"})
      refute changeset.valid?
    end
  end

  describe "delete category" do
    test "update category with success" do
      category = insert(:category)
      {:ok, result} = CategoryActions.delete_category(category.id)
      assert result.status === "deleted"
    end

    test "update category with error" do
      assert_raise(Ecto.NoResultsError, (fn ->  CategoryActions.delete_category(545) end))
    end
  end
end
