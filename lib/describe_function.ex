defmodule DescribeFunction do
  @moduledoc """
    Inspired by a [conversation on Twitter][twitter], `DescribeFunction` adds
    an additional layer of TDD to your Elixir application.

    The `describe_function/2` macro validates that the function you are testing
    is defined. This will catch untested changes to your application's API at a
    high level in your test suite, resulting in a single, straightforward error,
    rather than many errors that might occur at a more removed level of your API.

    ## Usage

      defmodule ExampleTest do
        use ExUnit.Case, asnyc: true

        import DescribeFunction

        describe_function &Example.hello_world/0 do
          test "hello_world functions as expected" do
            assert Example.hello_world() == "hello world"
          end
        end
      end

    Assuming your `Example` module implements `hello_world/0`, your test will
    pass or fail, based on its implementation. On the other hand, if
    `Example.hello_world/0` is undefined, running your tests will raise

      ** (DescribeFunction.UndefinedFunctionError) function not defined: &Example.hello_world/0

  [twitter]: https://twitter.com/zorn/status/1572788455507374082
  """

  @doc """

    This macro expands on the functionality of `ExUnit.Case.describe/2` by
    validating that the function passed as its first argument exists.

    This will catch untested changes to your application's API at a higher
    level in your test suite, resulting in a single, straightforward error,
    rather than many errors that might occur at a more removed level in your
    API.

  ## Usage

      defmodule ExampleTest do
        use ExUnit.Case, asnyc: true

        import DescribeFunction

        describe_function &Example.hello_world/0 do
          test "hello_world functions as expected" do
            assert Example.hello_world() == "hello world"
          end
        end
      end

  Assuming your `Example` module implements `hello_world/0`, your test will pass
  or fail, based on its implementation. On the other hand, if `Example.hello_world/0`
  is undefined, running your tests will raise

      ** (DescribeFunction.UndefinedFunctionError) function not defined: &Example.hello_world/0
  """
  defmacro describe_function(f, do: describe_block) do
    quote location: :keep do
      describe(func(unquote(f)), do: unquote(describe_block))
    end
  end

  @doc false
  def func(f) when is_function(f) do
    [module: module, name: name, arity: arity, env: _, type: _] = Function.info(f)

    if function_exported?(module, name, arity),
      do: inspect(f),
      else: raise(DescribeFunction.UndefinedFunctionError.for_function(f))
  end
end
