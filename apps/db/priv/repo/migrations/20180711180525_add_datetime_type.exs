defmodule DB.Repo.Migrations.AddCalendarDateTimeType do
  use Ecto.Migration

  def up do
    execute "CREATE TYPE calendar_datetime
             AS (wall_time timestamp,
                 total_off integer,
                 timezone  varchar(48))"
  end

  def down do
    execute "DROP TYPE calendar_datetime"
  end
end
