defmodule StateAgent do

  def start_link do
    Agent.start_link fn -> [] end
  end

  def push(pid, match) do
    Agent.update pid, fn matches -> [match | matches] end
  end

  def get(pid) do
    Agent.get pid, fn matches -> matches end
  end
  # def loop(state \\ []) do
  #   receive do
  #     {:add, value} ->
  #       state = [value | state]

  #     {:get} ->
  #       state
  #   end
  #   loop
  # end
end
