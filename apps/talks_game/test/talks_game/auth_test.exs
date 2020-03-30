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
    assert {:error, "User not found"} = TalksGame.Auth.signin("qwe", "rty")
  end

  test "signin: wrong password" do
    assert {:error, "Wrong password"} = TalksGame.Auth.signin("supplier2", "foo")
  end

  test "signin: more than 1 user in DB" do
    assert {:error, "More than one user in database"} = TalksGame.Auth.signin("consumer2", "foo")
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
    assert {:error, "Could not find session"} = TalksGame.Auth.signout("foo")
  end
end
