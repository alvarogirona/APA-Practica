defmodule RiotApiParser.Crawler do

  # Queue id for 5v5 ranked is 420

  defp api_key do
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
    api_base_url() <> "/summoner/v4/summoners/by-name/HoSoNg"
  end

  defp match_list_url(account_id) do
    api_base_url() <> "/match/v4/matchlists/by-account/#{account_id}?queue=420"
  end

  defp match_url(match_id) do
    api_base_url() <> "/match/v4/matches/#{match_id}"
  end

  def start_crawler(summoner_name) do
    get_user_id(summoner_name)
  end

  defp get_user_id(summoner_name) do
    HTTPoison.start()
    case HTTPoison.get(profile_url(summoner_name), headers()) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        %{"accountId" => accountId} = Jason.decode!(body)
        get_match_history(accountId)
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        IO.puts "Not found :("
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect reason
    end
  end

  defp get_match_history(account_id) do
    HTTPoison.start()
    case HTTPoison.get(match_list_url(account_id), headers()) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        %{"matches" => matches} = Jason.decode!(body)
        Enum.each(matches, fn match ->
          %{"gameId" => matchId} = match
          IO.puts(matchId)
          log_results(matchId)
        end)
        for match <- matches do
          %{"gameId" => matchId} = match
          spawn get_match_data(matchId, account_id)
        end
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        IO.puts "Not found :("
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect reason
    end
  end

  defp get_match_data(match_id, orig_account_id) do
    HTTPoison.start()
    case HTTPoison.get(match_url(match_id), headers()) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        %{"participantIdentities" => participants} = Jason.decode!(body)
        Enum.each(participants, fn participant ->
          %{"player" => %{"accountId" => accountId}} = participant
          if accountId != orig_account_id do
            get_match_history(accountId)
          end
        end)
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        IO.puts "Not found :("
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect reason
    end
  end

  defp log_results(results) do
    case File.open("/Users/alvaro/Documents/Uni/4o/APA/APA-Practica/matches_id.txt", [:append]) do
      {:ok, file} ->
        IO.write(file, results)
        IO.write(file, "\n")
        File.close(file)
      _ ->
        IO.puts("Error opening file")
    end

  end
end
