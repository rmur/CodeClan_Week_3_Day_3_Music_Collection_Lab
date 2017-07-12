require('pry')
require_relative('album.rb')

album1 = Album.new('title' => 'The Works', 'genre' => 'Rock')

album2 = Album.new('title' => 'Apetite for Destruction', 'genre' => 'Rock')

artist1 = Artist.new('name' => 'Queen')

artist2 = Artist.new('name' => 'Guns & Roses')

album1.save

album2.save

artist1.save

artist2.save

