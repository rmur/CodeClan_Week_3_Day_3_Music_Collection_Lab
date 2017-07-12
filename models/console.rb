require('pry')
require_relative('album.rb')

album1 = Album.new('title' => 'The Works', 'genre' => 'Rock')

album2 = Album.new('title' => 'Apetite for Destruction', 'genre' => 'Rock')

album1.save

album2.save