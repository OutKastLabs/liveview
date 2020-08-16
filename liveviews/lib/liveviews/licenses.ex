defmodule Liveviews.Licenses do
  def calculate(seats) do
    if seats <= 5 do
      seats * 20
    else
      100 + (seats - 5) * 15.0
    end
  end
end
