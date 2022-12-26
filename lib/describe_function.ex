defmodule DescribeFunction do
  @moduledoc """
  Documentation for `DescribeFunction`.
  """

  def func(f) when is_function(f) do
    [module: module, name: name, arity: arity, env: _, type: _] = Function.info(f)

    if function_exported?(module, name, arity),
      do: inspect(f),
      else: raise(DescribeFunction.UndefinedFunctionError.for_function(f))
  end

  defmacro describe_function(f, do: describe_block) do
    quote location: :keep do
      describe(func(unquote(f)), do: unquote(describe_block))
    end
  end
end
