require('pg')
require_relative('../db/music_sql_runner')

class Album

attr_reader :id
attr_accessor :tile, :genre

  def initialize(options)
    @title = options['title']
    @genre = options['genre']
    @id = options['id'].to_i if options['id']
  end

  def save
    sql = "INSERT INTO albums (title, genre) VALUES
        ('#{@title}', '#{@genre}') RETURNING id;"
    @id = SqlRunner.run(sql)[0]['id'].to_i
  end

  def self.delete_all
    sql = "DELETE FROM albums"
    SqlRunner.run(sql)
  end
  



end