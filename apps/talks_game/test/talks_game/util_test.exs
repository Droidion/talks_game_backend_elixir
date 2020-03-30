defmodule TalksGame.UtilTest do
  use ExUnit.Case

  test "in_range?: positive results" do
    assert true = TalksGame.Util.in_range?(10, 1..15)
    assert true = TalksGame.Util.in_range?(1, 1..15)
    assert true = TalksGame.Util.in_range?(15, 1..15)
  end

  test "in_range?: negative results" do
    assert {false, "-5 is out of range 0..100"} = TalksGame.Util.in_range?(-5, 0..100)
    assert {false, "105 is out of range 0..100"} = TalksGame.Util.in_range?(105, 0..100)
  end
end
