defmodule DescribeFunctionTest do
  use ExUnit.Case
  doctest DescribeFunction

  import DescribeFunction
  alias DescribeFunction

  describe_function &DescribeFunction.func/1 do
    test "returns inspecting an existing function" do
      assert DescribeFunction.func(&Enum.map/2) == "&Enum.map/2"
    end

    test "raises an error for a non-existent function" do
      assert_raise DescribeFunction.UndefinedFunctionError, ~r/&Enum.map\/3/, fn ->
        DescribeFunction.func(&Enum.map/3)
      end
    end
  end
end
