require('pry')
require_relative('album')
require_relative('artist')
Album.delete_all()
Artist.delete_all()




artist1 = Artist.new('name' => 'Queen')
artist1.save

album1 = Album.new('title' => 'The Works', 'genre' => 'Rock','artist_id' => artist1.id)
album1.save

album1.show_artist()
binding.pry


Album.list_all()



