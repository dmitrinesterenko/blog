defmodule BlogPhoenix.ModelCase do
  @moduledoc """
  This module defines the test case to be used by
  model tests.

  Finally, if the test case interacts with the database,
  it cannot be async. For this reason, every test runs
  inside a transaction which is reset at the beginning
  of the test unless the test case is marked as async.
  """

  use ExUnit.CaseTemplate

  using do
    quote do
      # Alias the data repository and import query/model functions
      alias BlogPhoenix.Repo
      import Ecto.Model
      import Ecto.Query, only: [from: 2]
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(BlogPhoenix.Repo)
    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(BlogPhoenix.Repo, {:shared, self()})
    end
  end

#  setup tags do
#    unless tags[:async] do
#      Ecto.Adapters.SQL.restart_test_transaction(BlogPhoenix.Repo, [])
#    end
#
#    :ok
#  end
end
