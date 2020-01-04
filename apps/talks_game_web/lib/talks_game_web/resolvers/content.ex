defmodule TalksGameWeb.Resolvers.Content do
  def signin(_parent, %{login: login, password: password}, _resolution) do
    case TalksGame.Auth.signin(login, password) do
      {:ok, session} -> {:ok, session}
      {:error, reason} -> {:error, reason}
    end
  end

  def signout(_parent, %{token: token}, _resolution) do
    case TalksGame.Auth.signout(token) do
      :ok -> {:ok, %{message: "Session terminated"}}
      {:error, reason} -> {:error, reason}
    end
  end
end
