defmodule BlogPhoenix.PageControllerTest do
  use BlogPhoenix.ConnCase

  test "GET /" do
    conn = get conn(), "/"
    assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  end

	test "GET /about" do
		conn = get conn(), "/about"
		assert html_response(conn, 200) =~ "About"
	end
end
