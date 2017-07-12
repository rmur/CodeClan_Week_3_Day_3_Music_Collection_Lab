require('pg')
require_relative('../db/music_sql_runner')

class Album

attr_reader :id
attr_accessor :tile, :genre ,:artist_id

  def initialize(options)
    @title = options['title']
    @genre = options['genre']
    @id = options['id'].to_i if options['id']
    @artist_id = options['artist_id'].to_i

  end

  def save()
    sql = "INSERT INTO albums (title, genre, artist_id) VALUES ('#{@title}', '#{@genre}', #{@artist_id}) RETURNING id;"
    @id = SqlRunner.run(sql)[0]['id'].to_i
  end

  def show_artist()
    sql = "SELECT * FROM artists WHERE id = #{@artist_id}"
    result = SqlRunner.run(sql)
    representation = result.map {|album| Album.new(album)}
    return representation
  end

  def self.list_all()
    sql = "SELECT * FROM albums;"
    all_albums = SqlRunner.run(sql)
    return all_albums.map{| album | Album.new(album)}

  end

  def self.delete_all()
    sql = "DELETE FROM albums"
    SqlRunner.run(sql)
  end
  



end