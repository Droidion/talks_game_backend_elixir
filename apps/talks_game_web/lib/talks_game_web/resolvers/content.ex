defmodule TalksGameWeb.Resolvers.Content do
  def auth(_parent, %{login: login, password: password}, _resolution) do
    case TalksGame.Auth.auth(login, password) do
      {:ok, token} -> {:ok, %{token: token}}
      {:error, reason} -> {:error, reason}
    end
  end
end
