class PerfectNumber
  def self.classify(n)
    raise "Negative number detected!" if n < 0
    factors = []
    1.upto(n - 1) do |factor|
      factors << factor if n % factor == 0
    end

    if factors.inject(:+) > n
      'abundant'
    elsif factors.inject(:+) < n
      'deficient'
    else
      'perfect'
    end
  end
end
