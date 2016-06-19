ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Guitarly.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Guitarly.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Guitarly.Repo)

