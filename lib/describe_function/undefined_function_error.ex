defmodule DescribeFunction.UndefinedFunctionError do
  defexception message: "function not defined: "

  def for_function(f) when is_function(f) do
    error = %__MODULE__{}
    %{error | message: error.message <> inspect(f)}
  end
end
