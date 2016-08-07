defmodule BlogPhoenix.ReaderView do
  use BlogPhoenix.Web, :view
  alias BlogPhoenix.Post
  alias BlogPhoenix.ReaderView

  def title(%Post{title: title}) do
    title
      |> String.upcase()
  end

  def preview(%Post{body: body}) do
    body
  end
end
