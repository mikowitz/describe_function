defmodule DescribeFuncTest do
  use ExUnit.Case
  doctest DescribeFunc

  import DescribeFunc
  alias DescribeFunc

  describe_func &DescribeFunc.func/1 do
    test "returns inspecting an existing function" do
      assert DescribeFunc.func(&Enum.map/2) == "&Enum.map/2"
    end

    test "raises an error for a non-existent function" do
      assert_raise DescribeFunc.UndefinedFunctionError, ~r/&Enum.map\/3/, fn ->
        DescribeFunc.func(&Enum.map/3)
      end
    end
  end
end
