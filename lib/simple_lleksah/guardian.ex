defmodule SimpleLleksah.Guardian do
  use Guardian, otp_app: :simple_lleksah

  alias SimpleLleksah.Repo
  alias SimpleLleksah.Users.User

  def subject_for_token(resource, _claims) do
    sub = to_string(resource.id)
    {:ok, sub}
    # tokenをdecodeすると、tokenの文字列の一部としてsub=xxxとidが表示される。
    # resource_from_claimsの中でclaims["sub"]としてidが取り出されている。
  end

  def subject_for_token(_, _) do
    {:error, :reason_for_error}
  end

  def resource_from_claims(claims) do
    id = claims["sub"]
    resource = Repo.get(User, id)
    {:ok, resource}
  end

  def resource_from_claims(_claims) do
    {:error, :reason_for_error}
  end
end
