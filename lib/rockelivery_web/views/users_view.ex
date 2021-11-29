defmodule RockeliveryWeb.UsersView do
  use RockeliveryWeb, :view

  alias Rockelivery.User

  def render("create.json", %{token: token, user: %User{} = user}) do
    %{
      message: "User created!",
      user: user,
      token: token
    }
  end

  def render("sign_in.json", %{token: token}), do: %{token: token}

  def render("show.json", %{token: token}), do: %{token: token}

  def render("show.json", %{user: user}), do: %{user: user}

  def render("user.json", %{user: %User{} = user}), do: %{user: user}

  def render("show_all_users.json", %{conn: %Plug.Conn{assigns: %{user: list}}}),
    do: %{users: list}
end
