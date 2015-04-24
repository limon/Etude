defmodule Geom do
  @moduledoc """
  Functions for calculating areas for geometric shapes.
  """
  @vsn 0.1

  def area(shape, param1, param2) when param1 > 0 and param2 > 0  do
    case shape do
      :rectangle -> param1 * param2
      :triangle -> param1 * param2 / 2
      :ellipse -> :math.pi() * param1 * param2
    end
  end
end

ExUnit.start

defmodule GeomTest do
  use ExUnit.Case

  test "compute area with negative parameters should faild" do
    assert_raise FunctionClauseError, fn -> Geom.area(:rectangle, -3, 4) end
    assert_raise FunctionClauseError, fn -> Geom.area(:triangle, -3, -4) end
    assert_raise FunctionClauseError, fn -> Geom.area(:ellipse, -3, -4) end
  end

  test "compute area with positive parameters" do
    assert Geom.area(:rectangle, 3, 4) == 12
    assert Geom.area(:triangle, 3, 5) == 7.5
    assert Geom.area(:ellipse, 2, 4) == 25.132741228718345
  end
end
