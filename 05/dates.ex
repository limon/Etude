defmodule Dates do
  def date_parts(date) do
    date
    |> String.split("-")
    |> Enum.map(&String.to_integer(&1))
  end
end

ExUnit.start

defmodule DatesTest do
  use ExUnit.Case

  test "get date parts" do
    assert Dates.date_parts("2013-06-15") == [2013,6,15]
  end
end
