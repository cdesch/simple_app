defmodule SimpleAppWeb.PageController do
  use SimpleAppWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
