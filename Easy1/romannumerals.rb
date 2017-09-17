class Integer
  ROMAN_LETTERS = ['I', 'V', 'X', 'L', 'C', 'D', 'M'].freeze

  def to_roman
    n = self
    digits = []
    exp = n.to_s.length - 1

    while exp >= 0
      digits << n / 10**exp
      n %= 10**exp
      exp -= 1
    end

    digits.reverse.each_with_object([]).with_index do |(t, roman), idx|
      roman.unshift(select_exp(t, idx))
    end.join
  end

  def select_exp(t, idx)
    case t
    when 1..3
      ROMAN_LETTERS[idx * 2] * t
    when 4
      ROMAN_LETTERS[idx * 2] + ROMAN_LETTERS[idx * 2 + 1]
    when 5..8
      ROMAN_LETTERS[idx * 2 + 1] + ROMAN_LETTERS[idx * 2] * (t - 5)
    when 9
      ROMAN_LETTERS[idx * 2] + ROMAN_LETTERS[idx * 2 + 2]
    else
      ''
    end
  end

  # NUMERALS = { 1000 => 'M', 900 => 'CM', 500 => 'D', 400 => 'CD', 100 => 'C',
  #              90 => 'XC', 50 => 'L', 40 => 'XL', 10 => 'X', 9 => 'IX',
  #              5 => 'V', 4 => 'IV', 1 => 'I' }
  #
  # def to_roman
  #   number = self
  #   return '' if number <= 0
  #   NUMERALS.each do |arabic, roman|
  #     return roman + (number - arabic).to_roman if number >= arabic
  #   end
  # end
end
