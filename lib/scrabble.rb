require 'entry'
require 'dictionary'
require 'algorithms'

class Scrabble
  attr_reader :dictionary

  def initialize
  	@dictionary = Dictionary.new
  end

  def find_anagram(input)
  	naive_algorithm.find(input)&.word
  end

  private

  def naive_algorithm
  	@naive ||= Algorithm::Naive.new(dictionary)
  end
end