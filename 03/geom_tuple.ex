defmodule Geom do
  @moduledoc """
  Functions for calculating areas for geometric shapes.
  """
  @vsn 0.1

  defp do_area(:rectangle, length, width) when length > 0 and width > 0 do
    length * width
  end

  defp do_area(:triangle, length, height) when length > 0 and height >0 do
    length * height / 2
  end

  defp do_area(:ellipse, radius1, radius2) when radius1 > 0 and radius2 >0 do
    :math.pi() * radius1 * radius2
  end

  def area({shape, param1, param2}) do
    do_area(shape, param1, param2)
  end
end

ExUnit.start

defmodule GeomTest do
  use ExUnit.Case

  test "compute area with negative parameters should faild" do
    assert_raise FunctionClauseError, fn -> Geom.area({:rectangle, -3, 4}) end
    assert_raise FunctionClauseError, fn -> Geom.area({:triangle, -3, -4}) end
    assert_raise FunctionClauseError, fn -> Geom.area({:ellipse, -3, -4}) end
  end

  test "compute area with positive parameters" do
    assert Geom.area({:rectangle, 3, 4}) == 12
    assert Geom.area({:triangle, 3, 5}) == 7.5
    assert Geom.area({:ellipse, 2, 4}) == 25.132741228718345
  end
end
