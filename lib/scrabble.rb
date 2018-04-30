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
    # @algorithm = (data[0].to_i == 1 ? naive_algorithm : nil)
    data[1]
  end

  def find_anagram(input)
    if solution = @algorithm.find(input)
      "#{solution.word} - #{solution.length}"
    end
  end

  private

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
