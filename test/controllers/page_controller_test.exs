defmodule BlogPhoenix.PageControllerTest do
  use BlogPhoenix.ConnCase

	test "GET /about" do
		conn = get conn(), "/about"
		assert html_response(conn, 200) =~ "about"
	end
end
