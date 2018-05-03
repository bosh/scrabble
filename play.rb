require './lib/scrabble'

puts <<-TEXT
Welcome to Scrabble
Algorithms are:
#1 - Naive      - Sort by length, then iterate over N dict entries with a character-by-character string/substring comparison
#2 - Hashlookup - Convert words into hash data and and use constant-time lookup, but a similar character-removal algorithm

Please query with "<Algo#> <letters>" without <>:

You can play 10 rounds:
TEXT

dictionary = Dictionary.from_usr
game = Scrabble.new(dictionary)
10.times do |i|
  puts "Round #{i}"
  game.play_round
end
