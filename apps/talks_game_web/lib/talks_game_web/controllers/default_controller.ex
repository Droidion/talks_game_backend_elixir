defmodule TalksGameWeb.DefaultController do
  use TalksGameWeb, :controller

  @spec index(Plug.Conn.t(), any) :: Plug.Conn.t()
  def index(conn, _params) do
    text(conn, "Talks Game!")
  end
end
