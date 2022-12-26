defmodule DescribeFunction.UndefinedFunctionError do
  @moduledoc """
    This error is raised when the function passed to `DescribeFunction.describe_function/2` does not exist.
  """

  defexception message: "function not defined: "

  @doc false
  def for_function(f) when is_function(f) do
    error = %__MODULE__{}
    %{error | message: error.message <> inspect(f)}
  end
end
