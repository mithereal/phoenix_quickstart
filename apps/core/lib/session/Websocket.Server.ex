defmodule Core.Session.Websocket.Server do
  use GenServer

  @name __MODULE__
  @expiry_sec 7200
  @registry_name :websocket_registry

  alias Leads.Lead.Zip.Supervisor, as: LZSUP
  alias Leads.Lead.Address.Supervisor, as: LASUP
  alias Leads.Lead.Zip.Server, as: LZS
  alias Leads.Lead.Address.Server, as: LAS

  defstruct id: nil,
            quotes: []

  def start_link(id) do
    name = via_tuple(id)

    GenServer.start_link(__MODULE__, [id], name: name)
  end

  defp via_tuple(id) do
    {:via, Registry, {@registry_name, id}}
  end

  ## server funs

  def init([id]) do
    #  Api.QuoteChannel.join "Quote:" <> id

    initial_state = %__MODULE__{id: id, quotes: []}

    {:ok, initial_state}
  end

  def send(id, struct) do
    IO.inspect(struct)

    try do
      GenServer.call(via_tuple(id), {:create_lead, struct})
    catch
      :exit, _ -> {:error, "websocket_doesnt_exist"}
    end
  end

  def send(id, struct, business_id) do
    IO.inspect(struct)

    try do
      GenServer.call(via_tuple(id), {:create_lead, struct, business_id})
    catch
      :exit, _ -> {:error, "websocket_doesnt_exist"}
    end
  end

  def handle_call({:create_lead, struct}, _from, state) do
    id = state.id

    case struct.type do
      "ADDRESS" ->
        lead_id = LASUP.start(state.id)
        LAS.setup(lead_id, struct)
        LAS.send(lead_id)

      _ ->
        lead_id = LZSUP.start(state.id)
        LZS.setup(lead_id, struct)
        LZS.send(lead_id)
    end

    response = {:ok, "msg"}
    {:reply, response, state}
  end

  def handle_call({:create_lead, struct, company_id}, _from, state) do
    id = state.id

    case struct.type do
      "ADDRESS" ->
        lead_id = LASUP.start(state.id)
        LAS.setup(lead_id, struct)
        LAS.send(lead_id, company_id)

      _ ->
        lead_id = LZSUP.start(state.id)
        LZS.setup(lead_id, struct)
        LZS.send(lead_id)
    end

    response = {:ok, "msg"}
    {:reply, response, state}
  end

  def handle_cast({:add_quote, quote}, state) do
    Api.QuoteChannel.broadcast_quote(quote, state.id)

    new_quotes = state.quotes ++ [quote]

    updated_state = %__MODULE__{id: state.id, quotes: new_quotes}
    {:noreply, updated_state}
  end
end
