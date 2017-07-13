require('pry')
require_relative('album')
require_relative('artist')
Album.delete_all()
Artist.delete_all()




artist1 = Artist.new({'name' => 'Queen'})
artist1.save

album1 = Album.new({'artist_id' => artist1.id,
'title' => 'The Works',
 'genre' => 'Rock'})
album1.save

album1.show_artist()
artist1.album()
binding.pry


Album.list_all()



