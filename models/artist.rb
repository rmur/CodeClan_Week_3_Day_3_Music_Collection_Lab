require('pg')
require('music_sql_runner')

class Artist

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @name = options['name']
    @id = options['id'].to_i
    @album_id = options['album_id'].to_i
  end

  def save
    sql = "INSERT INTO artists (name) VALUES
          ('#{@name}') RETURNING id;"
    @id = SqlRunner.run(sql)[0]['id'].to_i
  end

  def self.delete_all
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end






end

