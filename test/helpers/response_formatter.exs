defmodule BlogPhoenix.ResponseFormatterTest do
  use BlogPhoenix.ResponseFormatter
  alias BlogPhoenix.ResponseFormatter
  use ExUnit.Case, async: true

  @error_response [title: {"can't be blank", []}]

  test "format the error response" do
    text = ResponseFormatter.format_error(@error_response)
    assert text == ["title can't be blank"]
  end

end
