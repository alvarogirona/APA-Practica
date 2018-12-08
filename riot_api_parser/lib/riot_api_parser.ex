defmodule RiotApiParser.CLI do
  @moduledoc """
  Documentation for RiotApiParser.
  """

  @doc """
  Hello world.

  ## Examples

      iex> RiotApiParser.hello()
      :world

  """
  def main(args \\ []) do
    parsed_args =
      args
      |> parse_args

    IO.inspect(parsed_args)
    case parsed_args[:summoner] do
      nil ->
        IO.puts("You need to specify a summoner name to start looking for matches!")
      _ ->
        IO.puts("Starting crawler")
        RiotApiParser.Crawler.start_crawler
    end
  end

  defp parse_args(args) do
    {opts, _, _} =
      args
      |> OptionParser.parse(switches: [champion: :string, summoner: :string])

    opts
  end

end
