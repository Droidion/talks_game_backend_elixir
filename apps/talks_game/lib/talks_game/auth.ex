defmodule TalksGame.Auth do
  @moduledoc """
  User authorization logic
  """

  alias TalksGame.Schemas.User
  alias TalksGame.Session
  import TalksGame.Util
  @repo TalksGame.Repo

  # Searches for a user in a database by user login.
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
  Tries to sign in with given login and password

  ## Parameters

    * `login`: String that represents user login
    * `password`: String that represents user password

  ## Examples

      iex> TalksGame.Auth.signin("foo", "bar")
      {:error, "User not found"}

      iex> TalksGame.Auth.signin("supplier1", "supplier1")
      {:ok,
       %TalksGame.Session{
         created_at: ~U[2020-03-29 12:15:36.547327Z],
         is_commander: false,
         team_number: 1,
         team_type: "supplier",
         token: "1423fcd4-a8b7-4346-8cae-d6686762cfd0",
         updated_at: ~U[2020-03-29 12:15:36.547353Z]
       }}
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
  Tries to sign out user by a token

  ## Parameters

    * `token`: String that represents user token

  ## Examples

      iex> TalksGame.Auth.signout("1423fcd4-a8b7-4346-8cae-d6686762cfd0")
      :ok

      iex> TalksGame.Auth.signout("foo")
      {:error, "Could not find session"}
  """
  @spec signout(String.t()) :: :ok | {:error, String.t()}
  def signout(token) do
    case Redix.command(:redix, ["DEL", "session:" <> token]) do
      {:ok, 0} -> {:error, "Could not find session"}
      {:ok, _} -> :ok
      {:error, reason} -> {:error, reason}
    end
  end

  @spec check_role_by_token(String.t(), String.t()) :: :ok | {:error, String.t()}
  def check_role_by_token(token, role) do
    with {:ok, session_stringified} <- Redix.command(:redix, ["GET", "session:" <> token]),
         {:ok, session} <- Jason.decode(session_stringified),
         role_cached when role_cached == role <- session["team_type"] do
      :ok
    else
      nil -> {:error, "Session not found"}
      {:error, reason} -> {:error, reason}
    end
  end
end
