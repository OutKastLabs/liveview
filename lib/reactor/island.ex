defmodule Reactor.Island do
  alias __MODULE__

  def start_link() do
   Agent.start_link(fn -> [] end)
  end
end
