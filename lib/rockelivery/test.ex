defmodule Test do
  alias Rockelivery.{Repo, User}
  # alias Rockelivery.Items.Create
  alias Rockelivery.Orders.Create

  def test do
    # "77617308-777f-4ddd-8de7-876c01fbbb94" user
    params = %{
      "items" => [
        %{"id" => "c63b96ae-5ea8-4296-8e5e-8f522fa2f9d0", "quantity" => 2},
        %{"id" => "ff3e3718-fdbc-49d5-a7fb-6c0607052c87", "quantity" => 2},
        %{"id" => "9074332b-50b7-4fcf-a23e-2410e4bf6602", "quantity" => 2}
      ],
      "user_id" => "1c50d6ed-0aa5-4eaa-a087-5eab43d767e1",
      "address" => "Rua Trombone",
      "payment_method" => "money",
      "comments" => "Meu pedido nao chegou"
    }

    Create.call(params)
  end
end
