require 'sqlite3'
require 'singleton'
require_relative 'questions_database'

class UsersDatabase < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Users
  attr_accessor :fname, :lname, :id
  
  def self.all
    data = UsersDatabase.instance.execute('SELECT * FROM users')
    data.map { |datum| Users.new(datum)}
  end

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def self.find_by_name(fname, lname)
    users = UsersDatabase.instance.execute(<<-SQL, fname, lname)
    SELECT
      *
    FROM
      users
    WHERE
      fname = ? AND lname = ?
    SQL
    Users.new(users[0])
  end

  def authored_questions


  end
  

end