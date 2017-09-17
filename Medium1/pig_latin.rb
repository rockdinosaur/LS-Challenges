class PigLatin
  def self.translate(str)
    str.split.map do |word|
      if start_with_vowel?(word)
        word << 'ay'
      elsif start_with_xy?(word)
        parse_xy(word)
      elsif start_with_cons_qu?(word)
        parse_cons_qu(word)
      else
        parse_consanants(word)
      end
    end.join(' ')
  end

  def self.start_with_vowel?(word)
    word =~ /\A[aeiou]/
  end

  def self.parse_consanants(word)
    consanants = word.match(/\A[^aeiou]+/)
    word[consanants.to_s.length..-1] << consanants.to_s << 'ay'
  end

  def self.start_with_xy?(word)
    word =~ /\A[xy]/
  end

  def self.parse_xy(word)
    if word =~ /\A[xy][aeiou]/
      x_or_y = word.match(/\A[xy]/)
      word[1..-1] << x_or_y.to_s << 'ay'
    else
      word << 'ay'
    end
  end

  def self.start_with_cons_qu?(word)
    word =~ /\A[^aeiou]*qu/
  end

  def self.parse_cons_qu(word)
    cons_qu = word.match(/\A[^aeiou]*qu/)
    word[cons_qu.to_s.length..-1] << cons_qu.to_s << 'ay'
  end
end

p PigLatin.translate('square queen')
