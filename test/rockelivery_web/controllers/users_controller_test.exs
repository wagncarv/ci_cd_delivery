defmodule RockeliveryWeb.UsersControllerTest do
  use RockeliveryWeb.ConnCase, async: true

  import Rockelivery.Factory

  describe "create/2" do
    test "when all params are valid, create the user", %{conn: conn} do
      params = %{
        "age" => 19,
        "address" => "Rua Elixir",
        "cep" => "29000000",
        "cpf" => "12345678910",
        "email" => "mail@mail.com",
        "name" => "Sektor",
        "password" => "12345678"
      }

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:created)
    end

    test "when there are errors, create the user", %{conn: conn} do
      params = %{
        "name" => "Sektor",
        "password" => "12345678"
      }

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:bad_request)

      expected_response = %{
        "error" => %{
          "address" => ["can't be blank"],
          "age" => ["can't be blank"],
          "cep" => ["can't be blank"],
          "cpf" => ["can't be blank"],
          "email" => ["can't be blank"]
        }
      }

      assert expected_response == response
    end
  end
end
