defmodule BlogPhoenix.PostTest do
  use BlogPhoenix.ModelCase

  alias BlogPhoenix.Post

  @valid_attrs %{body: "some content", slug: "some content", title: "some content"}
  @invalid_attrs %{}
  @incomplete_attrs %{title: "a"}

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
