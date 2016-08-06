defmodule BlogPhoenix.ResponseFormatter do
  def format_error(error_enum) do
    Enum.map(error_enum, fn {k,v} -> "#{k} #{elem(v,0)}" end)
  end

  def __using__(__module__) do
    IO.puts("AHOY MATEY")
  end
end
