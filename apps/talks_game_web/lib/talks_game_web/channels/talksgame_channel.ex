defmodule TalksGameWeb.TalksgameChannel do
  use Phoenix.Channel

  def join("talksgame", _message, socket) do
    {:ok, socket}
  end
end
