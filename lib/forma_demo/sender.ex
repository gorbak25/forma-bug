defmodule FormaDemo.Sender do
  use GenServer

  def start_link(_args) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(args) do
    :timer.send_after(1000, self(), :work)
    {:ok, args}
  end

  def handle_info(:work, state) do
    FormaDemo.Receiver.receive(%{"name" => "test"})
    :timer.send_after(1000, self(), :work)
    {:noreply, state}
  end
end
