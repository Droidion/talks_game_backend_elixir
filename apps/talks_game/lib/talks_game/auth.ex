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

  # Generate UUID v4 for using as a token.
  @spec generate_uuid :: String.t()
  defp generate_uuid() do
    UUID.uuid4()
  end

  # Search for a user in a database by user login.
  @spec user_by_login(String.t()) :: {:ok, user()} | {:error, String.t()}
  defp user_by_login(login) do
    # That's boilerplate solution
    # TODO search user in database
    case login do
      "foo" ->
        {:ok,
         %{
           login: "foo",
           password: "bar"
         }}

      _ ->
        {:error, "User not found"}
    end
  end

  # Checks if password is correct for a found user.
  @spec password_matches?(user(), String.t()) :: :ok | {:error, String.t()}
  defp password_matches?(user, password) do
    if user.password == password, do: :ok, else: {:error, "Wrong password"}
  end

  @doc """
    Authenticate with given login and password.

    Returns session token or error text.
  """
  @spec auth(String.t(), String.t()) :: {:ok, String.t()} | {:error, String.t()}
  def auth(login, password) do
    with {:ok, user} <- user_by_login(login),
         :ok <- password_matches?(user, password) do
      {:ok, generate_uuid()}
    else
      {:error, reason} -> {:error, reason}
    end
  end
end
