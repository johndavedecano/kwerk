defmodule Kwerk.Account.Account do

    alias Kwerk.Account.User
    alias Kwerk.Repo

    def create_user(user_params) do
        User
        |> User.create_changeset
        |> Repo.insert(user_params)
    end

    def update_user(%User{} = user, user_params) do
        
    end

    def delete_user do
        
    end
end 