class Octal
  attr_reader :numstring

  def initialize(numstring)
    @numstring = numstring
  end

  def to_decimal
    total = 0
    numstring.chars.reverse.each_with_index do |n, idx|
      return 0 unless ('0'..'7').include?(n)
      total += n.to_i * 8 ** idx
    end
    total
  end
end
