defmodule TalksGameTest do
  use ExUnit.Case
  doctest TalksGame

  test "greets the world" do
    assert TalksGame.hello() == :world
  end
end
