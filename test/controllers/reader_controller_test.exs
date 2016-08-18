defmodule BlogPhoenix.ReaderControllerTest do
  use BlogPhoenix.ConnCase

  test "GET /read" do
    conn = get build_conn(), "/read"
    assert html_response(conn, 200) =~ "Read"
  end

  test "GET /" do
    conn = get build_conn(), "/"
    assert html_response(conn, 200) =~ "Read"
  end
end
