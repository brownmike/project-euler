# Consecutive prime sum
# Problem 50

# The prime 41, can be written as the sum of six consecutive primes:

  # 41 = 2 + 3 + 5 + 7 + 11 + 13

# This is the longest sum of consecutive primes that adds to a prime below
# one-hundred.

# The longest sum of consecutive primes below one-thousand that adds to a
# prime, contains 21 terms, and is equal to 953.

# Which prime, below one-million, can be written as the sum of the most
# consecutive primes?

require 'prime'
require 'benchmark'

class Euler50
  def self.solve
    primes = Prime.each(1_000_000).to_a
    number = 0
    longest = 0
    2.upto(546) do |i| # first 547 primes add up to > 1 mil
      primes.each_cons(i) do |sequence|
        candidate = sequence.inject(:+)
        break unless candidate < 999_999
        if sequence.length > longest && candidate.prime?
          number = candidate
          longest = sequence.length
        end
      end
    end
    number
  end
end

p Benchmark.measure { puts Euler50.solve }
