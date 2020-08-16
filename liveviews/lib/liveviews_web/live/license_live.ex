defmodule LiveviewsWeb.LicenseLive do
  use LiveviewsWeb, :live_view

  def mount(_params, _session, socket) do
    socket = assign(socket, seats: 2, amount: 10)
    {:ok, socket}
  end
end
