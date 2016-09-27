defmodule BlogPhoenix.WriterViewTest do
  alias BlogPhoenix.WriterView
  alias BlogPhoenix.Post
  use BlogPhoenix.ConnCase, async: false
  import Phoenix.View

  # TODO: You are bringing this nonsense
  # into this test. This should be a factory
  @posts [%Post{id: "1234",
  title: "the Narrative of The Man From Narangasett",
        body: "The winter falls were almost frozen. Moving slowly like the line
at the bakery next to the even more life retardant post office. It was a Tuesday
in February"}]


  test "new post" do
    view = render_to_string(WriterView, "new.html", post: %Post{}, conn: build_conn())
    assert view =~ "post"
  end

  test "edit post" do
    {_, post} = Enum.fetch(@posts, 0)
    view = render_to_string(WriterView, "edit.html", post: post, conn: build_conn())
    assert view =~ "method=\"put\""
  end
end
