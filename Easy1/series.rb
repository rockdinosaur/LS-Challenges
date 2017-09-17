# 1 Series

# Write a program that will take a string of digits and give you all the possible consecutive number series of length n in that string.
#
# For example, the string "01234" has the following 3-digit series:
#
# - 012
# - 123
# - 234
# And the following 4-digit series:
#
# - 0123
# - 1234
# And if you ask for a 6-digit series from a 5-digit string, you deserve whatever you get.

class Series
  attr_reader :numstring

  def initialize(numstring)
    @numstring = numstring
  end

  def slices(n)
    raise ArgumentError, "Too large of a slice!" if n > numstring.length

    numstring.chars.each_cons(n).each_with_object([]) do |digits, slices|
      slices << digits.map(&:to_i)
    end
  end
end
