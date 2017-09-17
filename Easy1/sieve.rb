class Sieve
  attr_reader :range

  def initialize(n)
    @range = (2..n).to_a
  end

  # def primes
  #   range.each_with_object([]) do |n, primes|
  #     multiple = 2
  #     primes << n
  #
  #     while (n * multiple) <= range.max
  #       range.delete(n * multiple)
  #       multiple += 1
  #     end
  #   end
  # end

  def primes
    range.each_with_object([]) do |prime, primes|
      primes << prime
      range.reject! { |num| (num % prime == 0) && (num != prime) }
    end
  end
end

sieve = Sieve.new(100)
p sieve.primes
