defmodule BlogPhoenix.ReaderControllerTest do
  use BlogPhoenix.ConnCase

  test "GET /read" do
    conn = get conn(), "/read"
    assert html_response(conn, 200) =~ "Read"
  end
end
