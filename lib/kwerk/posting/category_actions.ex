defmodule Kwerk.Posting.CategoryActions do

  alias Kwerk.Posting.Category
  alias Kwerk.Repo
  alias Kwerk.Constants

  @doc """
    Find category by id but raises Ecto.NoResultsError if no record was found
  """
  def find_by_id!(id) do
    Repo.get!(Category, id)
  end

  @doc """
    Find category by id but raises no error if no record was found
  """
  def find_by_id(id) do
    Repo.get(Category, id)
  end

  @doc """
    Inserts a category defined on the changeset
  """
  def create_category(category_params) do
    changeset = Category.changeset(%Category{}, category_params)
    changeset |> Repo.insert
  end

  @doc """
    Updates a category defined on the changeset
  """
  def update_category(category, category_params) do
    changeset = Category.changeset(category, category_params)
    changeset |> Repo.update
  end

  @doc """
    Deletes a category but sets its status to `Constants.cSTATUS_DELETED`
  """
  def delete_category(id) do
    category = find_by_id!(id)
    changeset = Category.changeset(category, %{status: Constants.cSTATUS_DELETED})
    changeset |> Repo.update
  end
end
