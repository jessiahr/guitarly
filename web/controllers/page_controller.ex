defmodule Guitarly.PageController do
  use Guitarly.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
