defmodule TalksGame.Auth do
  @moduledoc """
  User authorization.
  """

  alias TalksGame.User
  alias TalksGame.Session
  @repo TalksGame.Repo

  # Generate UUID v4 for using as a token.
  @spec generate_uuid :: String.t()
  defp generate_uuid() do
    UUID.uuid4()
  end

  # Search for a user in a database by user login.
  @spec user_by_login(String.t()) :: {:ok, User} | {:error, String.t()}
  defp user_by_login(login) do
    try do
      user = @repo.get_by!(User, login: login)
      {:ok, user}
    rescue
      Ecto.NoResultsError -> {:error, "User not found"}
      Ecto.MultipleResultsError -> {:error, "More than one user in database"}
    end
  end

  # Checks if password is correct for a found user.
  @spec password_matches?(User, String.t()) :: :ok | {:error, String.t()}
  defp password_matches?(user, password) do
    if Argon2.verify_pass(password, user.password),
      do: :ok,
      else: {:error, "Wrong password"}
  end

  @doc """
    Try to sign in with given login and password.

    Returns session token or error text.
  """
  @spec signin(String.t(), String.t()) :: {:ok, Session} | {:error, String.t()}
  def signin(login, password) do
    with {:ok, user} <- user_by_login(login),
         :ok <- password_matches?(user, password) do
      uuid = generate_uuid()

      session = %Session{
        token: uuid,
        team_number: user.team_number,
        team_type: user.team_type,
        is_commander: false,
        created_at: DateTime.utc_now(),
        updated_at: DateTime.utc_now()
      }

      # Cache new session to Redis
      Redix.command(:redix, ["SET", "session:" <> uuid, Jason.encode!(session), "EX", "180000"])
      {:ok, session}
    else
      {:error, reason} -> {:error, reason}
    end
  end

  @doc """
    Try sign out user by a token

    Returns success flag or error text.
  """
  @spec signout(String.t()) :: :ok | {:error, String.t()}
  def signout(token) do
    case Redix.command(:redix, ["DEL", "session:" <> token]) do
      {:ok, 0} -> {:error, "Could not find session"}
      {:ok, _} -> :ok
      {:error, reason} -> {:error, reason}
    end
  end
end
