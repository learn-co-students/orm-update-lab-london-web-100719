require 'sqlite3'
require_relative '../lib/student'

DB = {:conn => SQLite3::Database.new("db/students.db")}
# db = SQLite3::Database.new("db/students.db")
# DB[:conn].wahatever
# db.whatever