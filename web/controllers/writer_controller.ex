defmodule BlogPhoenix.WriterController do
  use BlogPhoenix.Web, :controller
  alias BlogPhoenix.Post
  alias BlogPhoenix.Repo
  alias BlogPhoenix.ResponseFormatter

  def new(conn, _params) do
    conn
      |> render("new.html", post: %Post{})
  end

  def create(conn, params) do
    post = Post.changeset(%Post{}, %{title: params["title"], slug: params["slug"], body: params["body"]})
   {status, response} = Repo.insert(post)
   case status do
     :ok -> conn
       |> redirect(to: "/")
       |> halt()
     _ -> conn
       |> put_status(422)
       |> put_flash(:error, ResponseFormatter.format_error(response.errors))
       |> render("new.html", post: %Post{})
   end
  end

  def edit(conn, params) do
    post = Repo.get!(Post, params["post_id"])
    case post do
      nil -> conn
        |> put_status(404)
        |> redirect(to: "/")
        |> halt()
      _ -> conn
        |> render("edit.html", post: post, title: "Edit")

    end
  end

  def save(conn, params) do
    post = Repo.get!(Post, params["post_id"])
    post_save = Post.changeset(post, %{title: params["title"], slug: params["slug"], body: params["body"]})
    {status, response} = Repo.update(post_save)
    case status do
      :ok -> conn
        |> redirect(to: "/")
        |> halt()
      _ -> conn
        |> put_status(422)
        |> put_flash(:error, ResponseFormatter.format_error(response.errors))
        |> render("edit.html", post: post, title: "Edit")
    end
  end

end
