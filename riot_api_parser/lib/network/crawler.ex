defmodule RiotApiParser.Crawler do

  # Queue id for 5v5 ranked is 420

  def api_key do
    #System.get_env("API_KEY")
    "RGAPI-54c4d4e7-41ab-42c0-a60d-e8cea8c2b23a"
  end

  defp headers do
    ["X-Riot-Token": api_key()]
  end

  defp api_base_url do
    "https://euw1.api.riotgames.com/lol"
  end

  defp profile_url(summoner_name) do
    api_base_url() <> "/summoner/v4/summoners/by-name/The%20Guzman"
  end

  defp match_list_url(account_id) do
    api_base_url() <> "/match/v4/matchlists/by-account/#{account_id}?queue=420"
  end

  def start_crawler(summoner_name) do
    get_user_id(summoner_name)
  end

  defp get_user_id(summoner_name) do
    HTTPoison.start()
    case HTTPoison.get(profile_url(summoner_name), headers()) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        %{"accountId" => accountId} = Jason.decode!(body)
        IO.puts accountId
        get_match_history(accountId)
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        IO.puts "Not found :("
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect reason
    end
  end

  defp get_match_history(account_id) do
    IO.puts match_list_url(account_id)
    HTTPoison.start()
    case HTTPoison.get(match_list_url(account_id), headers()) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        IO.inspect(body)
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        IO.puts "Not found :("
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect reason
    end
  end

  def get_match(id) do
    IO.puts(api_key)
  end
end
