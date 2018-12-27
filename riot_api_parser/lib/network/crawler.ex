defmodule RiotApiParser.Crawler do

  def api_key do
    #System.get_env("API_KEY")
    "RGAPI-02f1a590-938a-4bd9-ae53-34e377e9b41d"
  end

  @spec start_crawler(String) :: :ok
  def start_crawler(summoner) do
    get_match(1)
  end

  def get_match(id) do
    IO.puts(api_key)
  end
end
