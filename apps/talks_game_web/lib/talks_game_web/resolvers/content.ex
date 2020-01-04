defmodule TalksGameWeb.Resolvers.Content do
  def auth(_parent, %{login: login, password: password}, _resolution) do
    case TalksGame.Auth.auth(login, password) do
      {:ok, session} -> {:ok, session}
      {:error, reason} -> {:error, reason}
    end
  end
end
