defmodule DescribeFunc do
  @moduledoc """
  Documentation for `DescribeFunc`.
  """

  def func(f) when is_function(f) do
    [module: module, name: name, arity: arity, env: _, type: _] = Function.info(f)

    if function_exported?(module, name, arity),
      do: inspect(f),
      else: raise(DescribeFunc.UndefinedFunctionError.for_function(f))
  end

  defmacro describe_func(f, do: describe_block) do
    quote location: :keep do
      describe(func(unquote(f)), do: unquote(describe_block))
    end
  end
end
