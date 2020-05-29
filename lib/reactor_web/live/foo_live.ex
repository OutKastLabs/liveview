defmodule ReactorWeb.FooLive do
  use Phoenix.LiveView

  def mount(_params, _session, socket) do
    {:ok, assign(socket, msg: "siddhant")}
  end

  def render(assigns) do
    ~L"""
    <h1>Hi!</h1>
    <div phx-keydown="keydown" phx-target="window">
     <%= @msg %>
    </div>
    """
  end

  def handle_event("keydown", %{"key" => key}, socket) do
    {:noreply, assign(socket, msg: key)}
  end
end
