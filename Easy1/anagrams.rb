class Anagram
  attr_reader :anagram, :letter_hash

  def initialize(anagram)
    @anagram = anagram
  end

  # def create_letter_hash
  #   @letter_hash = Hash.new(0)
  #   anagram.downcase.chars { |char| @letter_hash[char] += 1 }
  # end
  #
  # def match(word_arr)
  #   create_letter_hash
  #   anagrams = []
  #
  #   word_arr.each do |word|
  #     next if word.downcase == anagram.downcase || word.length != anagram.length
  #     is_anagram = true
  #     word.downcase.chars.each do |char|
  #       if word.downcase.count(char) != letter_hash[char]
  #         is_anagram = false
  #         break
  #       end
  #     end
  #
  #     anagrams << word if is_anagram
  #   end
  #   anagrams
  # end

  def match(word_arr)
    word_arr.select do |word|
       is_anagram(word) && is_not_same(word)
    end
  end

  def is_not_same(word)
    word.downcase != anagram.downcase
  end

  def is_anagram(word)
    word.downcase.chars.sort == anagram.downcase.chars.sort
  end
end
