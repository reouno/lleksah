defmodule SimpleLleksahWeb.UserView do
  use SimpleLleksahWeb, :view
  alias SimpleLleksahWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      email: user.email,
      name: user.name,
      password_hash: user.password_hash,
      is_premium: user.is_premium}
  end
end
