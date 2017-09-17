class SumOfMultiples
  attr_reader :multiples

  def initialize(*multiples)
    @multiples = multiples.empty? ? [3, 5] : multiples
  end

  def self.to(n)
    new.to(n)
  end

  def to(n)
    (1..(n - 1)).select { |num| multiples.any? { |multiple| num % multiple == 0 }}.inject(0) do |sum, num|
      sum + num
    end
  end
end
