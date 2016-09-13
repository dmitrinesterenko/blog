require IEx
defmodule BlogPhoenix.WriterControllerTest do
  use BlogPhoenix.ConnCase

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
end
