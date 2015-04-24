defmodule Dates do
  @month_days [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
  def julian(date) do
    [year, month, day] = date |> String.split("-") |> Enum.map(&String.to_integer/1)
    if leap_year?(year) and month > 2, do: day = day + 1
    month_total(month) + day
  end

  defp leap_year?(year) do
    rem(year, 4) == 0 and rem(year, 100) != 0 or rem(year, 400) == 0
  end

  def month_total(month), do: do_month_total(month - 1, @month_days, 0)
  defp do_month_total(0, _, acc), do: acc
  defp do_month_total(n, [head | tail], acc), do: do_month_total(n - 1, tail, acc + head)
end

ExUnit.start

defmodule DatesTest do
  use ExUnit.Case

  test "get the day of the year" do
    assert Dates.julian("2013-12-31") == 365
    assert Dates.julian("2012-12-31") == 366
    assert Dates.julian("2012-02-05") == 36
    assert Dates.julian("2013-02-05") == 36
    assert Dates.julian("1900-03-01") == 60
    assert Dates.julian("2000-03-01") == 61
    assert Dates.julian("2013-01-01") == 1
  end
end
