defmodule SimpleApp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      SimpleApp.Repo,
      # Start the Telemetry supervisor
      SimpleAppWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: SimpleApp.PubSub},
      # Start the Endpoint (http/https)
      SimpleAppWeb.Endpoint,
      # Start a worker by calling: SimpleApp.Worker.start_link(arg)
      # {SimpleApp.Worker, arg}
      {SimpleApp.CounterSup, [10000, 10001]}

    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SimpleApp.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    SimpleAppWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
