require IEx
defmodule BlogPhoenix.WriterControllerTest do
  use BlogPhoenix.ConnCase


  test "GET /write" do
    conn = get conn(), "/write"
    assert html_response(conn, 200) =~ "Title"
  end

  test "POST /write with correct parameters" do
    conn = post conn(), "/write", [title: "test title", body: "test body"]
    assert html_response(conn, 200) =~ "Saved"
  end

  test "POST /write with missing title" do
    conn = post conn(), "/write", [body: "test body"]
    assert html_response(conn, 422) =~ Phoenix.HTML.Safe.to_iodata("title can't be blank")
  end
end
