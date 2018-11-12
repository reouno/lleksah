defmodule SimpleLleksahWeb.SessionView do
  use SimpleLleksahWeb, :view

  def render("sign_in.json", %{user: user, jwt: jwt}) do
    %{"token": jwt}
  end

  def render("error.json", %{message: message}) do
    %{"error": message}
  end
end
