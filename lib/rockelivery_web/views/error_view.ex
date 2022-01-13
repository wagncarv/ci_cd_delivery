defmodule RockeliveryWeb.ErrorView do
  use RockeliveryWeb, :view

  alias Ecto.Changeset
  import Ecto.Changeset, only: [traverse_errors: 2]

  # If you want to customize a particular status code
  # for a certain format, you may uncomment below.
  # def render("500.json", _assigns) do
  #   %{errors: %{detail: "Internal Server Error"}}
  # end
  def render("error.json", %{result: %Changeset{} = changeset}) do
    %{error: translate_errors(changeset)}
  end

  def render("error.json", %{conn: %Plug.Conn{assigns: %{result: result}}}) do
    %{error: result}
  end

  defp translate_errors(changeset) do
    traverse_errors(changeset, fn {msg, opts} ->
      Enum.reduce(opts, msg, fn {key, value}, acc ->
        String.replace(acc, "%{#{key}}", translate_value(value))
      end)
    end)
  end

  defp translate_value({:parameterized, Ecto.Enum, _}), do: ""
  defp translate_value(value), do: to_string(value)

  # By default, Phoenix returns the status message from
  # the template name. For example, "404.json" becomes
  # "Not Found".
  def template_not_found(template, _assigns) do
    %{errors: %{detail: Phoenix.Controller.status_message_from_template(template)}}
  end
end
