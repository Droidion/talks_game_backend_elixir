defmodule TalksGame.AuthTest do
  use ExUnit.Case

  test "generates non-empty string" do
    assert String.length(TalksGame.Auth.generate_uuid()) > 0
  end

  test "good cred" do
    assert TalksGame.Auth.credentials_fit?("foo", "bar") == true
  end

  test "bad cred" do
    assert TalksGame.Auth.credentials_fit?("qwe", "rty") == false
  end
end
