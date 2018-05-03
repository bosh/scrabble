require_relative 'entry'
require_relative 'dictionary'
require_relative 'algorithms'

class Scrabble
  INSTRUCTIONS = 'Please query with "<Algo#> <letters>" without <>:'

  attr_reader :dictionary, :algorithm

  def initialize
  	@dictionary = Dictionary.new
    @algorithm = naive_algorithm
  end

  def play_round
    puts find_anagram(get_letters)
  end

  def get_letters
    puts INSTRUCTIONS
    data = gets.split(' ')
    @algorithm = (data[0].to_i == 2 ? prehash_algorithm : naive_algorithm)
    data[1]
  end

  def find_anagram(input)
    if solution = @algorithm.find(Entry.new(input))
      "#{solution.word} - #{solution.length}"
    else
      ''
    end
  end

  private

  # No reason to do setup work for the algo handlers until they are requested,
  # no reason to throw away the work if the user switches away
  def prehash_algorithm
    @prehash ||= Algorithm::Prehash.new(dictionary)
  end

  def naive_algorithm
  	@naive ||= Algorithm::Naive.new(dictionary)
  end

  #My Windows system was behaving strangely with the direct mocks
  def gets(*args)
    Kernel.gets(*args)
  end

  def puts(*args)
    Kernel.puts(*args)
  end
end
