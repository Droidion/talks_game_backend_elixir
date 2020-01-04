defmodule TalksGame.AuthTest do
  use ExUnit.Case

  test "good cred with token" do
    assert {:ok, token} =
             TalksGame.Auth.signin(
               "supplier1",
               "supplier1"
             )

    assert String.length(token) > 0
  end

  test "user not found" do
    assert {:error, reason} = TalksGame.Auth.signin("qwe", "rty")
    assert reason == "User not found"
  end

  test "wrong password" do
    assert {:error, reason} = TalksGame.Auth.signin("supplier2", "foo")
    assert reason == "Wrong password"
  end

  test "more than 1 user in DB" do
    assert {:error, reason} = TalksGame.Auth.signin("consumer2", "foo")
    assert reason == "More than one user in database"
  end
end
