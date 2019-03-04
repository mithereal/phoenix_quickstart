defmodule Core.Session.Websocket.Supervisor do
  use Supervisor

  @registry_name :websocket_registry

  def start_link do
    Supervisor.start_link(__MODULE__, nil, name: __MODULE__)
  end

  def init(_) do
    children = [worker(Core.Session.Websocket.Server, [], restart: :transient)]

    supervise(children, strategy: :simple_one_for_one)
  end

  def start() do
    [:springgreen, "Starting Websocket: "]
    |> Bunt.puts()

    id = Base.encode64(:crypto.strong_rand_bytes(20))

    Supervisor.start_child(__MODULE__, [id])
    id
  end

  def start(id) do
    [:springgreen, "Starting Websocket:  " <> id]
    |> Bunt.puts()

    Supervisor.start_child(__MODULE__, [id])
  end

  def stop(id) do
    [:springgreen, "Stopping Websocket  " <> id]
    |> Bunt.puts()

    case Registry.lookup(@registry_name, {@registry_name, id}) do
      [] ->
        {:ok, id}

      [{pid, _}] ->
        Process.exit(pid, :shutdown)
        {:ok, id}
    end
  end

  def whereis(id) do
    case Registry.lookup(@registry_name, id) do
      [{pid, _}] -> pid
      [] -> nil
    end
  end

  def find_or_create(id) do
    if process_exists?(id) do
      {:ok, id}
    else
      id |> start
    end
  end

  def exists?(id) do
    case Registry.lookup(@registry_name, id) do
      [] -> false
      _ -> true
    end
  end

  def list do
    Supervisor.which_children(__MODULE__)
    |> Enum.map(fn {_, account_proc_pid, _, _} ->
      Registry.keys(@registry_name, account_proc_pid)
      |> List.first()
    end)
    |> Enum.sort()
  end

  def process_exists?(hash) do
    case Registry.lookup(@registry_name, hash) do
      [] -> false
      _ -> true
    end
  end
end
