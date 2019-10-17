require_relative "../config/environment.rb"
require 'pry'

class Student

  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]

  attr_accessor :name, :grade, :id

  def initialize(id=nil, name, grade)
    @id = id
    @name = name
    @grade = grade
  end

  def self.create_table
    sql = "CREATE TABLE students (id INTEGER PRIMARY KEY, name TEXT, grade INTEGER);"
    
    DB[:conn].execute(sql)
  end
  
  def self.drop_table
    sql = "DROP TABLE students;"
    
    DB[:conn].execute(sql)
  end

  def save
    if self.id
      sq1 = "UPDATE students SET name = ?, grade = ? WHERE id = ?;"
      DB[:conn].execute(sq1, self.name, self.grade, self.id)
    else
      sql = "INSERT INTO students (name, grade) VALUES (?, ?);"
      DB[:conn].execute(sql, self.name, self.grade)
    end
    
  end


end
