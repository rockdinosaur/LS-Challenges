class Trinary
  attr_reader :numstring

  def initialize(n)
    @numstring = n
  end

  def to_decimal
    total = 0

    numstring.reverse.chars.each_with_index do |digit_str, idx|
      return 0 unless ('0'..'2').include?(digit_str)
      total += digit_str.to_i * (3 ** idx)
    end

    total
  end
end
