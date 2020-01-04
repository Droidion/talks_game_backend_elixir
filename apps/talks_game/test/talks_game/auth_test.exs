defmodule TalksGame.AuthTest do
  use ExUnit.Case

  test "signin: good cred with token" do
    assert {:ok, session} =
             TalksGame.Auth.signin(
               "supplier1",
               "supplier1"
             )

    assert String.length(session.token) > 0
  end

  test "signin: user not found" do
    assert {:error, reason} = TalksGame.Auth.signin("qwe", "rty")
    assert reason == "User not found"
  end

  test "signin: wrong password" do
    assert {:error, reason} = TalksGame.Auth.signin("supplier2", "foo")
    assert reason == "Wrong password"
  end

  test "signin: more than 1 user in DB" do
    assert {:error, reason} = TalksGame.Auth.signin("consumer2", "foo")
    assert reason == "More than one user in database"
  end

  test "signout: existing token" do
    {:ok, session} =
      TalksGame.Auth.signin(
        "supplier1",
        "supplier1"
      )

    assert :ok = TalksGame.Auth.signout(session.token)
  end

  test "signout: non-existing token" do
    assert {:error, reason} = TalksGame.Auth.signout("foo")
    assert reason == "Could not find session"
  end
end
