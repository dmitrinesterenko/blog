defmodule BlogPhoenix.PostTest do
  use BlogPhoenix.ModelCase

  alias BlogPhoenix.Post

  @valid_attrs %{body: "some content", slug: "some content", title: "some content"}
  @invalid_attrs %{}
  @incomplete_attrs %{title: "a"}
  @long_post %{body: "As you listen to the neighbors rattle with the garbage lids like raccoons you struggle to hear a melody. It's like classical music however it's supposed to make you smarter. \r\n\r\nGarbage lids are meant to make you more apt to write a modern piece of music.\r\n\r\nYou'll see them again in the morning, hellos exchanged while you grab the first distraction. The lids
handles heating up to skin searing.\r\n\r\n", title: "long post"}

  test "accepts a post with valid attributes" do
    changeset = Post.changeset(%Post{}, @valid_attrs)
    assert changeset.valid?
  end

  test "rejects a post with missing attributes" do
    changeset = Post.changeset(%Post{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "rejects a post with a title shorter than 2 chars" do
    changeset = Post.changeset(%Post{}, @incomplete_attrs)
    refute changeset.valid?
    {message, _length} = changeset.errors[:title]
    assert message == "should be at least 2 characters"
  end

  test "uses a UUID" do
    changeset = Post.changeset(%Post{}, @valid_attrs)
    {:ok, record} = Repo.insert(changeset)
    assert String.length(record.id) == 36
  end

  test "accepts a long body" do
    changeset = Post.changeset(%Post{}, @long_post)
    {:ok, record} = Repo.insert(changeset)
    assert String.length(record.body) == String.length(@long_post.body)
  end

end
