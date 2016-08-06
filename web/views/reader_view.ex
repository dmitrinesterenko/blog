defmodule BlogPhoenix.ReaderView do
  use BlogPhoenix.Web, :view
  alias BlogPhoenix.Post

  def title(%Post{title: title}) do
    title
      |> String.upcase()
  end

end
