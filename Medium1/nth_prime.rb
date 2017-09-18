class Prime
  def self.nth(n)
    raise(ArgumentError, "Nonzero or negative nth detected!") if n <= 0

    primes = []
    2.upto(Float::INFINITY) do |counter|
      prime = true
      2.upto(counter - 1) do |factor|
        prime = false if counter % factor == 0
      end
      primes << counter if prime
      break if primes.length >= n
    end

    primes.last
  end
end
