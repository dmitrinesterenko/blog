FROM marcelocg/phoenix:latest

RUN apt-get update
# Looks that marcelo's image is missing psql so the default use of Postgres
# is not available. This is smart of the original image because the
# tools used by Ecto to connect to the DB depend on the
# DB decision of each phoenix project
RUN apt-get install -y postgresql-client
# TODO: this is weird to do since I'm pulling from latest of
# phoenix but I get errors if I do not do this of this variety
# app_1 | npm WARN my_phoenix No license field.
# app_1 | ** (CaseClauseError) no case clause matching: {:error, :tokens}
# app_1 |     (kernel) file.erl:1368: :file.consult_stream/3
# app_1 |     (kernel) file.erl:978: :file.consult/1
# app_1 |     (mix) lib/mix/dep/elixir_scm.ex:20: Mix.Dep.ElixirSCM.read/1
# app_1 |     (mix) lib/mix/dep.ex:263: Mix.Dep.check_manifest/2
# app_1 |     (elixir) lib/enum.ex:1088: Enum."-map/2-lists^map/1-0-"/2
# app_1 |     (elixir) lib/enum.ex:1088: Enum."-map/2-lists^map/1-0-"/2
# app_1 |     (mix) lib/mix/tasks/deps.check.ex:21: Mix.Tasks.Deps.Check.run/1
# app_1 |     (mix) lib/mix/task.ex:291: Mix.Task.deps_loadpaths/0
# app_1 |
# blogphoenix_app_1 exited with code 1
#
RUN apt-get install -y elixir
EXPOSE 4000
