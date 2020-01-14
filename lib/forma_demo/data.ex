defmodule FormaDemo.Data do
  defstruct [:name]
  @type t() :: %FormaDemo.Data{name: String.t()}
end
