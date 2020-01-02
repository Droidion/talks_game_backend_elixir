defmodule TalksGame.AuthTest do
  use ExUnit.Case

  test "good cred with token" do
    assert {:ok, token} = TalksGame.Auth.auth("foo", "bar")
    assert String.length(token) > 0
  end

  test "user not found" do
    assert {:error, reason} = TalksGame.Auth.auth("qwe", "rty")
    assert reason == "User not found"
  end

  test "wrong  password" do
    assert {:error, reason} = TalksGame.Auth.auth("foo", "qwe")
    assert reason == "Wrong password"
  end
end
