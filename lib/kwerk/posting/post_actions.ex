defmodule Kwerk.Posting.PostActions do

  alias Kwerk.Repo
  alias Kwerk.Posting.Post

  def find_post_by_id!(id) do
    Post |> Repo.get!(id)
  end

  def find_post_by_id(id) do
    Post |> Repo.get(id)
  end

  def create_post(post_params) do
    changes = Changset.change()
  end

  def update_post(post, post_params) do

  end

  def delete_post(id) do

  end
end
