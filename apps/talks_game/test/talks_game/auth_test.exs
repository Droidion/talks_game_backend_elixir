defmodule TalksGame.AuthTest do
  use ExUnit.Case

  test "good cred with token" do
    assert {:ok, token} = TalksGame.Auth.auth("supplier1", "$argon2i$v=19$m=65536,t=10,p=1$oqNVkvb6yPPzFEPiC8MsJQ$tYbdOoDWT/NIffnhB6isk1GsFUKAkUKzTczfMhiG1bA")
    assert String.length(token) > 0
  end

  test "user not found" do
    assert {:error, reason} = TalksGame.Auth.auth("qwe", "rty")
    assert reason == "User not found"
  end

  test "wrong password" do
    assert {:error, reason} = TalksGame.Auth.auth("supplier2", "foo")
    assert reason == "Wrong password"
  end

  test "wrong  password" do
    assert {:error, reason} = TalksGame.Auth.auth("consumer2", "foo")
    assert reason == "More than one user in database"
  end

end
