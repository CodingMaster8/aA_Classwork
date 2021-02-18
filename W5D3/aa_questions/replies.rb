require 'sqlite3'
require 'singleton'

class RepliesDatabase < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Reply
  attr_accessor :id
  def self.all
    data = RepliesDatabase.instance.execute('SELECT * FROM replies')
    data.map { |datum| Reply.new(datum)}
  end

  def initialize(options)
    @id = options['id']
    @questions_id = options['questions_id']
    @parent_reply_id = options['parent_reply_id']
    @users_id = options['users_id']
    @body = options['body']
  end

  def self.find_by_id(id)
    reply = RepliesDatabase.instance.execute(<<-SQL ,id)
    SELECT
     *
    FROM
      replies
    WHERE
      id = ?
    SQL
    Reply.new(reply[0])
  end

  def self.find_by_user_id(id)
    reply = RepliesDatabase.instance.execute(<<-SQL ,id)
    SELECT
     *
    FROM
      replies
    WHERE
      id = ?
    SQL
    Reply.new(reply[0])
  end
    
  def self.find_by_question_id(id)
    reply = RepliesDatabase.instance.execute(<<-SQL ,id)
    SELECT
     *
    FROM
     replies
    WHERE
      id = ?
    SQL
      Reply.new(reply[0])
    end
  end

end

