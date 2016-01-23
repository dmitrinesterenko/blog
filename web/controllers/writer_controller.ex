require IEx
defmodule BlogPhoenix.WriterController do
  use BlogPhoenix.Web, :controller
  alias BlogPhoenix.Post  
  plug :action

  def index(conn, _params) do
    render conn,"index.html"
  end

  def new(conn, _params) do
    put_flash(conn, :my, "DEBUGMESSAGE")
    IO.puts "----------------"
    IO.puts get_flash(conn, :my)
    IO.puts "----------------"
    render conn, "new.html"
  end
  
  def create(conn, params) do
   #IEx.pry
   #post = Post.changeset(%{title: params["title"], slug: params["slug"], body: params["body"]})
   message = ""#post.save
   if message == "" do
      message = "Saved"
   end

   # This does not print out an :info message
   # TODO investigate why it does not 
   # Time to debug and use get_flash :info
   #put_flash conn, :info,  "Saved"
   # This is one way of rendering
   #render conn, "new.html"
   # This is another way of doing multiple actions with a connection
   conn
    |> put_flash(:info, message)
    |> render "new.html" #, info: message
  end
end
