defmodule TalksGameWeb.DefaultController do
  use TalksGameWeb, :controller

  def index(conn, _params) do
    text conn, "Talks Game!"
  end
end