defmodule BlogPhoenix.PageController do
  use BlogPhoenix.Web, :controller

  # plug :action

  def index(conn, _params) do
    render conn, "index.html"
  end

  def about(conn, _params) do
    render conn, "about.html"
  end
end
