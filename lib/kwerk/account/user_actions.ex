defmodule Kwerk.Account.UserActions do
  @moduledoc """
    Handles user management
  """
  alias Kwerk.Account.User
  alias Kwerk.Repo
  alias Kwerk.Constants

  import Ecto.Changeset, only: [change: 2]

  @doc """
    Find user by id but raises Ecto.NoResultsError if no record was found
  """
  def find_by_id!(id) do
    Repo.get!(User, id)
  end

  @doc """
    Find user by id but raises no error if no record was found
  """
  def find_by_id(id) do
    Repo.get(User, id)
  end

  @doc """
    Inserts a user defined on the changeset
  """
  def create_user(user_params) do
    User.changeset(%User{}, user_params) |> Repo.insert
  end

  @doc """
    Updates a user defined on the changeset
  """
  def update_user(user, user_params) do
    User.update_changeset(user, user_params) |> Repo.update
  end

  @doc """
    Deletes a user but sets its status to `Constants.cSTATUS_DELETED`
  """
  def delete_user(id) do
    user = find_by_id!(id)
    Repo.update(change(user, status: Constants.cSTATUS_DELETED))
  end
end
