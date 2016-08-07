defmodule BlogPhoenix.WriterController do
  use BlogPhoenix.Web, :controller
  alias BlogPhoenix.Post
  alias BlogPhoenix.Repo
  alias BlogPhoenix.ResponseFormatter

  def index(conn, _params) do
    conn
      |> render("index.html")
  end

  def new(conn, _params) do
    conn
      |> put_flash(:info, "DEBUGMESSAGE")
      |> render("new.html")
  end

  def create(conn, params) do
   post = Post.changeset(%Post{}, %{title: params["title"], slug: params["slug"], body: params["body"]})
   {status, response} = Repo.insert(post)
   case status do
     :ok -> conn
       |> put_status(200)
       |> put_flash(:info, "Saved")
       |> render("new.html")
     _ -> conn
       |> put_status(422)
       |> put_flash(:error, ResponseFormatter.format_error(response.errors))
       |> render("new.html")
   end
  end
end
