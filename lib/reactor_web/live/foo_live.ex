defmodule ReactorWeb.FooLive do
  use Phoenix.LiveView

  def mount(_params, _session, socket) do
    {:ok, assign(socket, key: "siddhant")}
  end

  def render(assigns) do
    ~L"""
    <h1>Hi!</h1>
    <%= @key %>
    """
  end
end
