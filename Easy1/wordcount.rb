class Phrase
  attr_reader :str

  def initialize(str)
    @str = str
  end

  def word_count
    words_hsh = Hash.new(0)
    str.scan(/\b[\w]+'*[\w]*\b/).each { |word| words_hsh[word.downcase] += 1 }
    words_hsh
  end
end
