# DescribeFunction

Inspired by a [conversation on Twitter][twitter], `DescribeFunction` adds an
additional layer of TDD to your Elixir application.

## Usage

```elixir
defmodule ExampleTest do
  use ExUnit.Case, asnyc: true

  import DescribeFunction

  describe_function &Example.hello_world/0 do
    test "hello_world functions as expected" do
      assert Example.hello_world() == "hello world"
    end
  end
end
```

Assuming your `Example` module implements `hello_world/0`, your test will pass
or fail, based on its implementation. On the other hand, if `Example.hello_world/0`
is undefined, running your tests will raise

```elixir
** (DescribeFunction.UndefinedFunctionError) function not defined: &Example.hello_world/0
```

The `describe_function/2` macro validates that the function you are testing is
defined. This will catch untested changes to your application's API at a high
level in your test suite, resulting in a single, straightforward error, rather
than many errors that might occur at a more removed level of your API.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `describe_function` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:describe_function, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/describe_function>.

[twitter]: https://twitter.com/zorn/status/1572788455507374082
