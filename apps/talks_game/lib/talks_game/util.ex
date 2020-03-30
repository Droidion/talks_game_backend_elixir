defmodule TalksGame.Util do
  @moduledoc """
  Various utilities and helpers
  """

  @doc """
  Checks if a number is inside a range of number

  ## Parameters

    * `number`: Integer that we want to check
    * `min..max`: Range of integers we want to check against

  ## Examples

      iex> TalksGame.Util.in_range?(5, 0..100)
      true

      iex> TalksGame.Util.in_range?(-5, 0..100)
      {false, "-5 is out of range 0..100"}
  """
  @spec in_range?(integer, Range.t()) :: true | {false, String.t()}
  def in_range?(number, min..max) do
    number in min..max || {false, "#{number} is out of range #{min}..#{max}"}
  end

  @doc """
  Generates UUID v4 for using as a token

  ## Example

      iex> TalksGame.Util.generate_uuid()
      "ec27ddf9-4dd6-46a6-bf2b-0d2bf007fb4c"

  """
  @spec generate_uuid :: String.t()
  def generate_uuid() do
    UUID.uuid4()
  end
end
