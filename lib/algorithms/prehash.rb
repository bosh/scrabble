class Algorithm::Prehash
  def initialize(dictionary)
    @dictionary = dictionary
    generate_hash!
  end

  def find(input_entry)
    @queue = [input_entry]
    @checked_subsets = {}
    @result = nil
    while @result.nil? && @queue.any?
      @result = check_entry(@queue.shift)
    end
    @result
  end

  private

  def generate_hash!
    #I'm not going to implement a bare hash myself, unfortunately making the memory footprint of our hash significantly larger than necessary
    @hash = {}
    @dictionary.all_by_length.each do |entry|
      #Multiple words can match lexographically and only one can win here
      @hash[entry.lexicographic] ||= entry
    end
  end

  def check_entry(input_entry)
    @checked_subsets[input_entry.lexicographic] = true

    if found = @hash[input_entry.lexicographic]
      found
    else
      all_letters = input_entry.lexicographic.split('')
      uniq_letters = all_letters.uniq #This has a time cost but unique items in word-size arrays isn't going to be the issue here

      uniq_letters.each do |letter|
        new_letters = input_entry.lexicographic.sub(letter, '')
        @queue.push(Entry.new(new_letters)) unless @checked_subsets[new_letters]
      end

      nil
    end
  end
end
