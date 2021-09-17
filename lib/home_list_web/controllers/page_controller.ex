defmodule HomeListWeb.PageController do
  use HomeListWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
