defmodule FormaDemoTest do
  use ExUnit.Case

  test "Forma parses data correctly" do
    assert :ok = FormaDemo.Receiver.receive(%{"name" => "TEST"})
  end
end
