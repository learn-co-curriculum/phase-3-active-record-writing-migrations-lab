# ActiveRecord::Base.establish_connection(
#     adapter: "sqlite3",
#     database: "db/development.sqlite3"
# )

# sql = <<-SQL
#   CREATE TABLE IF NOT EXISTS students (
#   id INTEGER PRIMARY KEY,
#   name TEXT,
#   )
# SQL

# ActiveRecord::Base.connection.execute(sql)


class Student < ActiveRecord::Base
end
