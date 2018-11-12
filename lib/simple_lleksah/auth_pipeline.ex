defmodule SimpleLleksah.Guardian.AuthPipeline do
  @claims %{typ:  "access"}

  use Guardian.Plug.Pipeline, otp_app: :SimpleLleksah,
                              module: SimpleLleksah.Guardian,
                              error_handler: SimpleLleksah.Guardian.AuthErrorHandler

  # validate token in session
  # if not using session, this plug will be ignored.
  plug Guardian.Plug.VerifySession, claims: @claims

  # validate the token in Authorization header is unchanged
  plug Guardian.Plug.VerifyHeader, claims: @claims, realm: "Bearer"

  # check if exists correct token else call auth_error
  plug Guardian.Plug.EnsureAuthenticated

  # load resource from vefiried token
  plug Guardian.Plug.LoadResource, ensure: true
end

defmodule SimpleLleksah.Guardian.AuthErrorHandler do
  import Plug.Conn

  def auth_error(conn, {type, reason}, _opts) do
    body = Poison.encode!(%{message: to_string(type)})
    send_resp(conn, 401, body)
  end
end
