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
      |> Earmark.to_html()
  end

  def body(%Post{body: body}) do
    body
      |> Earmark.to_html()
  end
end
