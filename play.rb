require './lib/scrabble'

puts <<-TEXT
Welcome to Scrabble
Algorithms are:
#1 - Naive      - Sort by length, then iterate over N dict entries with a character-by-character string/substring comparison
#2 - Hashlookup - TODO: convert words into hash data and and use constant-time lookup, but a similar character-removal algorithm

TEXT

game = Scrabble.new
game.play_round
