defmodule SimpleLleksahWeb.SessionController do
  use SimpleLleksahWeb, :controller

  alias SimpleLleksah.Users.User

  def sign_in(conn,
        %{"session" => %{"email" => email, "password" => password}}) do
    case User.find_and_confirm_password(email, password) do
      {:ok, user} ->
        {:ok, jwt, _full_claims} = SimpleLleksah.Guardian.encode_and_sign(user)

        # for debug
        {:ok, claims} = SimpleLleksah.Guardian.decode_and_verify(jwt)
        IO.inspect(claims)

        conn
        |> render("sign_in.json", user: user, jwt: jwt)
      {:error, _reason} ->
        conn
        |> put_status(401)

        # defined at session_view.ex
        |> render("error.json", message: "Could not sign in")
    end
  end
end
