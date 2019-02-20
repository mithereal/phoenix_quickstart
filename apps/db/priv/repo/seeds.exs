import Ecto.Query

alias DB.Repo

import DB.Tools.Generator
import DB.Tools.Demo.Data

db_name = Application.get_env(:db, DB.Repo)[:database]

db_backup_file_name = "backup.sql"

sql_dir = Path.join([File.cwd!, "priv", "data"])

exec_sql = fn file_name  ->

  Mix.shell.cmd("psql -d  #{db_name} -f #{Path.join(sql_dir, file_name)}")
  Mix.shell.info "Database Successfully Seeded #{db_name} from #{file_name}"

end

db_backup_exists = File.regular?(Path.join(sql_dir, db_backup_file_name))


case(db_backup_exists) do
true -> exec_sql db_backup_file_name
false -> nil
end





