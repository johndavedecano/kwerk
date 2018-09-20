defmodule Kwerk.Utils.Guardian do
  use Guardian, otp_app: :kwerk

  alias Kwerk.Repo
  alias Kwerk.Account.User

  def subject_for_token(resource, _claims) do
    sub = to_string(resource.id)
    {:ok, sub}
  end

  # def subject_for_token(_, _) do
  #   {:error, :reason_for_error}
  # end

  def resource_from_claims(claims) do
    id = claims["sub"]
    resource = Repo.get(User, id)
    {:ok,  resource}
  end

  # def resource_from_claims(_claims) do
  #   {:error, :reason_for_error}
  # end
end
