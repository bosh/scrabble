class Entry
  attr_reader :word, :length, :lexicographic
  def initialize(word)
  	@word = word
  	@length = word.length
  	@lexicographic = word.split("").sort.join
  end
end