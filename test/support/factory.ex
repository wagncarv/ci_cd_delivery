defmodule Rockelivery.Factory do
  use ExMachina

  def user_params_factory do
    %{
      age: 19,
      address: "Rua Elixir",
      cep: "29000000",
      cpf: "12345678910",
      email: "mail@mail.com",
      name: "Sektor",
      password: "12345678"
    }
  end
end
