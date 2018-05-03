class Algorithm::Naive
  def initialize(dictionary)
    @dictionary = dictionary
  end

  def find(input_entry)
    @dictionary.all_by_length.detect do |entry|
      check_anagram(entry.lexicographic.split(''), input_entry.lexicographic.split(''))
    end
  end

  private

  def check_anagram(subset, superset)
    if subset.length > superset.length
      false
    elsif subset.length == superset.length
      subset == superset
    else # subset is shorter, now we're cookin
      if subset[0] == superset[0]
      	check_anagram(subset[1..-1], superset[1..-1])
      else
      	check_anagram(subset, superset[1..-1])
      end
    end
  end
end
