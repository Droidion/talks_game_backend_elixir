defmodule TalksGame.Auth do
  @moduledoc """
  User authorization.
  """

  @typedoc """
  User metadata
  """
  @type user() :: %{
          login: String.t(),
          password: String.t()
        }

  @doc """
    Generate UUID v4 for using as a token.

    Returns string based on pseudo-random bytes.

    ## Examples

      iex> TalksGame.Auth.generate_uuid()
      "fcfe5f21-8a08-4c9a-9f97-29d2fd6a27b9"

  """

  @spec generate_uuid :: String.t()
  def generate_uuid() do
    UUID.uuid4()
  end

  @doc """
    Search for a user in a database by user login.

    Returns user or error text

  """

  @spec user_by_login(String.t()) :: {:ok, user()} | {:error, String.t()}
  def user_by_login(login) do
    {:ok,
     %{
       login: "foo",
       password: "bar"
     }}
  end

  @doc """
    Checks if password is correct for a found user.

  """

  @spec password_fits?(user(), String.t()) :: boolean()
  def password_fits?(user, password) do
    user.password == password
  end

  @doc """
    Checks if login and password are correct.

  """

  @spec credentials_fit?(String.t(), String.t()) :: boolean()
  def credentials_fit?(login, password) do
    case user_by_login(login) do
      {:ok, user} -> password_fits?(user, password)
      {:error, _} -> false
    end
  end
end
