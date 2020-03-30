defmodule TalksGame.Timer do
  @moduledoc """
  Operations with timers
  """

  alias TalksGame.Schemas.Timer
  import TalksGame.Util

  @repo TalksGame.Repo

  @doc """
  Gets timer struct from the database for a selected period

  ## Parameters

    * `period`: Integer showing period that we want to get Timer for

  ## Examples

      iex> TalksGame.Timer.get_timer(1)
      {:ok,
       %TalksGame.Schemas.Timer{
         __meta__: #Ecto.Schema.Metadata<:loaded, "timers">,
         hour: 23,
         id: 1,
         inserted_at: ~N[2020-03-29 18:09:21],
         minute: 15,
         period: 1,
         updated_at: ~N[2020-03-30 00:16:18]
       }}

      iex> TalksGame.Timer.get_timer(7)
      {:error, "Could not find timer for period 7"}

  """
  @spec get_timer(integer) :: {:ok, Timer} | {:error, String.t()}
  def get_timer(period) do
    timer = @repo.get_by(Timer, period: period)

    if timer == nil do
      {:error, "Could not find timer for period #{period}"}
    else
      {:ok, timer}
    end
  end

  @doc """
  Updates hour and minute for some period's timer. Checks that hour and minute are within appropriate ranges.

  ## Parameters

    * `period`: Integer period that we want to update timer for
    * `hour`: Integer for new hour value
    * `minute`: Integer for new minute value

  ## Examples

      iex> TalksGame.Timer.set_timer(1, 23, 15)
      :ok

      iex> TalksGame.Timer.set_timer(-1, 23, 15)
      {:error, "Could not find period -1 in the database"}

      iex> TalksGame.Timer.set_timer(3, 53, 15)
      {:error, "New value 53 is out of range 0..23"}

  """
  @spec set_timer(integer, integer, integer) :: :ok | {:error, String.t()}
  def set_timer(period, hour, minute) do
    with true <- in_range?(hour, 0..23),
         true <- in_range?(minute, 0..59),
         timer when timer != nil <- @repo.get_by(Timer, period: period) do
      changeset = Timer.changeset(timer, %{hour: hour, minute: minute})
      @repo.update(changeset)
      :ok
    else
      nil -> {:error, "Could not find period #{period} in the database"}
      {false, details} -> {:error, "New value " <> details}
      _ -> {:error, "Could not update period #{period}"}
    end
  end
end
