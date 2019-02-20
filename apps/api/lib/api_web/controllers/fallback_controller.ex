defmodule ApiWeb.FallbackController do
  use ApiWeb, :controller

  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> render(ApiWeb.ErrorView, :"404")
  end

  def call(conn, {:error, :unauthorized}) do
    conn
    |> put_status(:unauthorized)
    |> render(ApiWeb.ErrorView, :"401")
  end

  def call(conn, {:error, "websocket_doesnt_exist"}) do
    conn
    |> put_status(:not_found)
    |> render(ApiWeb.ErrorView, :"404")
  end
end
