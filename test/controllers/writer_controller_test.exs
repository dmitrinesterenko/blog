defmodule BlogPhoenix.WriterControllerTest do
  use BlogPhoenix.ConnCase

  test "GET /write" do
    conn = get conn(), "/write"
    assert html_response(conn, 200) =~ "Title"
  end
  
  test "POST /write" do
    conn = post conn(), "/write"
    assert html_response(conn, 200) =~ "Saved"
  end
end
