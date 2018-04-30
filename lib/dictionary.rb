class Dictionary
  def initialize(words = ['abc', 'abab', 'ccccc', 'z', 'abcd'])
    @word_entries = words.map { |word| ::Entry.new(word) }
  end

  def all
    @word_entries.map(&:word)
  end

  def length
    @word_entries.length
  end

  def all_by_length
  	@by_length = @word_entries.sort_by(&:length).reverse
  end
end
