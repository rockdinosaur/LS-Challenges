class Luhn
  attr_reader :n

  def initialize(n)
    @n = n.to_s.chars.map(&:to_i)
  end

  def self.create(incomplete)
    if new(incomplete * 10).valid?
      incomplete * 10
    else
      incomplete * 10 + (10 - new(incomplete * 10).checksum % 10)
    end
  end

  def checksum
    addends.inject(:+)
  end

  def addends
    n.reverse.each_with_index.with_object([]) do |(num, idx), arr|
      if idx.odd?
        if num * 2 >= 10
          num = num * 2 - 9
        else
          num = num * 2
        end
      end
      arr.unshift(num)
    end
  end

  def valid?
    checksum % 10 == 0
  end
end
