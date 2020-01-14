defmodule FormaDemo.Receiver do
  use GenServer

  def receive(data) do
    GenServer.call(__MODULE__, {:receive, data})
  end

  def start_link(_args) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(args) do
    {:ok, args}
  end

  def handle_call({:receive, data}, _, state) do
    {:ok, %FormaDemo.Data{} = parsed} = Forma.parse(data, FormaDemo.Data)
    IO.puts("Received #{inspect(parsed)}")
    {:reply, :ok, state}
  end
end
