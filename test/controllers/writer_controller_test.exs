defmodule BlogPhoenix.WriterControllerTest do
  use BlogPhoenix.ConnCase

  @moduletag :integration

  setup do
    {:ok, [title: "title", body: "body", post_id: "05478f7b-2423-4698-983f-8c111a4fc85b", "new_body": "body 2"]}
  end

  test "GET /write presents the editor" do
    conn = get build_conn(), "/write"
    assert html_response(conn, 200) =~ "TITLE"
  end

  test "POST /write creates when parameters are correct" do
    conn = post build_conn(), "/write", [title: "test title", body: "test body"]
    assert html_response(conn, 302) =~ "redirected"
  end

  test "POST /write does not create when required fields are missing" do
    conn = post build_conn(), "/write", [body: "test body"]
    assert html_response(conn, 422) =~ Phoenix.HTML.Safe.to_iodata("title can't be blank")
  end

  @tag timeout: 300000
  test "GET /write/:post_id loads a post", context do
    conn = get build_conn(), "/write/#{context[:post_id]}"
    assert html_response(conn, 200) =~ context[:title]
    assert html_response(conn, 200) =~ context[:body]
  end

  #@tag :skip
  test "PUT /write/:post_id saves new content for the post", context do
    conn = put build_conn(), "/write/#{context[:post_id]}", %{post_id: context[:post_id], title: context[:title], body: context[:new_body]}
    assert html_response(conn, 302) =~ "redirected"
  end

end
