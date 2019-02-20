defmodule DB.Application do
  @moduledoc """
  The DB Application Service.

  The repos system business domain lives in this application.
"""
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    Supervisor.start_link([
      supervisor(DB.Repo, []),
    ], strategy: :one_for_one, name: DB.Supervisor)
  end
end
