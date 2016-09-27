defmodule BlogPhoenix.WriterView do
  use BlogPhoenix.Web, :view
  alias BlogPhoenix.Post
  alias BlogPhoenix.WriterView
  #TODO: You are bleeding this nonsense
  # into other areas this already appears in the ReaderView
  # get rid of and unify this somewhere else
  def id(%Post{id: id}) when is_nil(id) do
    ""
  end

  def id(%Post{id: id}) do
    id
  end

end
