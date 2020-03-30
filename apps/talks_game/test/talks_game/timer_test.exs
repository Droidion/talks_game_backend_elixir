defmodule TalksGame.TimerTest do
  use ExUnit.Case

  test "get_timer: success" do
    assert {:ok, _} = TalksGame.Timer.get_timer(1)
  end

  test "get_timer: fail" do
    assert {:error, "Could not find timer for period 7"} = TalksGame.Timer.get_timer(7)
  end

  test "get_all_timers: success" do
    assert {:ok, timers} = TalksGame.Timer.get_all_timers()
    assert length(timers) > 0
  end

  test "set_timer: success" do
    assert :ok = TalksGame.Timer.set_timer(1, 23, 15)
  end

  test "set_timer: fail" do
    assert {:error, "Could not find period -1 in the database"} =
             TalksGame.Timer.set_timer(-1, 23, 15)

    assert {:error, "New value 53 is out of range 0..23"} = TalksGame.Timer.set_timer(3, 53, 15)
    assert {:error, "New value 99 is out of range 0..59"} = TalksGame.Timer.set_timer(3, 23, 99)
  end
end
