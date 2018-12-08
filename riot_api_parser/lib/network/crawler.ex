defmodule RiotApiParser.Crawler do

  def api_key do
    System.get_env("API_KEY")
  end

  def start_crawler() do
    get_match(1)
  end

  def get_match(id) do
    IO.puts(api_key)
  end
end
