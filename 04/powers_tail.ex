defmodule Powers do
  import Kernel, except: [raise: 2]
  def raise(x, n), do: do_raise(x, n, 1)
  def do_raise(_, 0, acc), do: acc
  def do_raise(x, n, acc) when n < 0, do: 1 / do_raise(x, -n, acc)
  def do_raise(x, n, acc) do
    do_raise(x, n - 1, acc * x)
  end
end

ExUnit.start

defmodule PowersTest do
  use ExUnit.Case

  test "Compute x^n" do
    assert Powers.raise(5, 1) == 5
    assert Powers.raise(2, 3) == 8
    assert Powers.raise(1.2, 3) == 1.728
    assert Powers.raise(2, 0) == 1
    assert Powers.raise(2, -3) == 0.125
  end
end
