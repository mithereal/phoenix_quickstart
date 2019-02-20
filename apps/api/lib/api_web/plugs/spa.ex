defmodule ApiWeb.Plug.SPA do
  @behaviour Plug
  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _opts),
    do: send_file(conn, 200, Application.app_dir(:api, "priv") <> "/static/index.html")
end
