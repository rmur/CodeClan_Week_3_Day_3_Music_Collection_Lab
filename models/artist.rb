require('pg')
require('../db/music_sql_runner')

class Artist

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @name = options['name']
    @id = options['id'].to_i
  end

  def save
    sql = "INSERT INTO artists (name) VALUES
          ('#{@name}') RETURNING id;"
    @id = SqlRunner.run(sql)[0]['id'].to_i
  end

  def album()
    sql = "SELECT * FROM albums WHERE artist_id = #{@id} "
    result = SqlRunner.run(sql)
    return result.map {|album| Artist.new(album)}
  end

  def self.delete_all
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end

  def self.select_all
    sql = "SELECT * FROM artists"
    result = SqlRunner.run(sql)
    return result.map {|list| Artist.new(list)}
  end






end

