require './lib/scrabble'

puts <<-TEXT
Welcome to Scrabble
Algorithms are:
#1 - Naive      - Sort by length, then iterate over N dict entries with a character-by-character string/substring comparison
#2 - Hashlookup - Convert words into hash data and and use constant-time lookup, but a similar character-removal algorithm

TODO: Need to import or default to a larger dictionary
TODO: Need to make a game loop when stable
TEXT

game = Scrabble.new
game.play_round
