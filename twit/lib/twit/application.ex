defmodule Twit.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Twit.Repo,
      # Start the Telemetry supervisor
      TwitWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Twit.PubSub},
      # Start the Endpoint (http/https)
      TwitWeb.Endpoint
      # Start a worker by calling: Twit.Worker.start_link(arg)
      # {Twit.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Twit.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    TwitWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
