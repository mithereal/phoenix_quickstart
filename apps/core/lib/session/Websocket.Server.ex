defmodule Core.Session.Websocket.Server do
  use GenServer

  @name __MODULE__
  @expiry_sec 7200
  @registry_name :websocket_registry


  defstruct id: nil,
            data: []

  def start_link(id) do
    name = via_tuple(id)

    GenServer.start_link(__MODULE__, [id], name: name)
  end

  defp via_tuple(id) do
    {:via, Registry, {@registry_name, id}}
  end

  ## server funs

  def init([id]) do

    initial_state = %__MODULE__{id: id, data: []}

    {:ok, initial_state}
  end

end
