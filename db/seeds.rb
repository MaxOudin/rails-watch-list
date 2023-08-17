# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'json'
require 'open-uri'

Movie.destroy_all
x = 10
url = 'https://tmdb.lewagon.com/movie/top_rated'

puts "fake movie creation"

movies = JSON.parse(URI.open(url).read)
movies_data = movies['results']

movies_data.first(x).each do |movie|
  Movie.create!(
    title: movie['original_title'],
    overview: movie['overview'],
    poster_url: "https://image.tmdb.org/t/p/w500/#{movie['poster_path']}",
    rating: movie['vote_average']
  )
end
puts "creation done for #{x} movies"
