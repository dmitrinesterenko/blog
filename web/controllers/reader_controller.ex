defmodule BlogPhoenix.ReaderController do
  use BlogPhoenix.Web, :controller
  alias BlogPhoenix.{Post,Repo}

  def index(conn, _params) do
    posts = Repo.all(Post)
    conn
      |> render("index.html", posts: posts)
  end
end

