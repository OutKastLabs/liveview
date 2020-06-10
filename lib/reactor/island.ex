defmodule Reactor.Island do
  alias __MODULE__
  alias Reactor.Coordinate

  def start_link() do
   Agent.start_link(fn -> [] end)
  end

  def replace_coordinates(island, new_coordinates) when is_list new_coordinates do
   Agent.update(island, fn _state -> new_coordinates end)
  end

  def forested?(island) do island
    |> Agent.get(fn state -> state end)
    |> Enum.all?(fn coord -> Coordinate.hit?(coord) end)
  end
end
