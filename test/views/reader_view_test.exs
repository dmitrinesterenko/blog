defmodule BlogPhoenix.ReaderViewTest do
  alias BlogPhoenix.Post
  alias BlogPhoenix.ReaderView
  use BlogPhoenix.ConnCase, async: false

  # Bring render/3 and render_to_string/3 for testing custom views
  import Phoenix.View

  @posts [%Post{title: "the Narrative of The Man From Narangasett",
        body: "The winter falls were almost frozen. Moving slowly like the line
at the bakery next to the even more life retardant post office. It was a Tuesday
in February"},
        %Post{title: "life and Times of Weiner Stefanner",
body: "A curious little boy with a lop sided ear Weiner was always gregariously
in the way of his father who would have rather had another table that clealy
belonged to his pipe tobacco and accoutrements rather than this chubby little
grub whose ears made him seem as if he is hearing something that no one else
can. Matilde was impressed of course that she could pull off such an act of
angelic mischief and would make up stories about each of their neighbors when
Weiner's ear would point toward their town house in their tight little grouping
that surrounded if not the main but definitely the most picturesque square in
town."},
        %Post{title: "Walrus and the Yogurt",
        body: "http://www.walrusandtheyogurt.dmitri.co"}
]

  test "index view of posts" do
    assert render_to_string(ReaderView, "index.html", posts: @posts) =~
    "winter falls"
  end

  test "index view of posts has a link to create new" do
    reader_view = render_to_string(ReaderView, "index.html", posts: @posts)
    assert reader_view =~ "+"
    assert reader_view =~ "/write"
  end

 # test "read view" do
 #   {status, post} = Enum.fetch(@posts, 1)
 #   assert render_to_string(ReaderView, "reader.html", post: post) =~
 #   "A curious little boy with a lop sided ear"
 # end

  test "title" do
    {_status, post} = Enum.fetch(@posts, 0)
    assert ReaderView.title(post) == "THE NARRATIVE OF THE MAN FROM NARANGASETT"
  end

  test "preview" do
    {_status, post} = Enum.fetch(@posts, 1)
    assert ReaderView.preview(post) =~ "A curious little boy"
  end

  test "converts hyperlink text to hyperlinks" do
    {_status,post} = Enum.fetch(@posts, 2)
    assert ReaderView.body(post) =~ "<a href=\"http://www.walrusandtheyogurt.dmitri.co\">http://www.walrusandtheyogurt.dmitri.co</a>"
  end

  @tag :skip
  test "uses Markdown for all body displays" do
    # Use mocking here to ensure that markdown is called
    # on all render functions
    # then you can get rid of the individual test for hyperlinks above
  end

end
