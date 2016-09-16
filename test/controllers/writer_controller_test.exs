require IEx
defmodule BlogPhoenix.WriterControllerTest do
  use BlogPhoenix.ConnCase

  setup do
    {:ok, [title: "title", body: "body", id: "1", "new_body": "body 2"]}
  end

  test "GET /write" do
    conn = get build_conn(), "/write"
    assert html_response(conn, 200) =~ "TITLE"
  end

  test "POST /write with correct parameters" do
    conn = post build_conn(), "/write", [title: "test title", body: "test body"]
    assert html_response(conn, 302) =~ "redirected"
  end

  test "POST /write with missing title" do
    conn = post build_conn(), "/write", [body: "test body"]
    assert html_response(conn, 422) =~ Phoenix.HTML.Safe.to_iodata("title can't be blank")
  end

  test "PUT /write with correct parameters", context do
    conn = put build_conn(), "/write", [id: context[:id], title: context[:title], body: context[:new_body]]
    assert html_response(conn, 302) =~ "redirected"
  end

end
