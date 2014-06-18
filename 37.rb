# Truncatable primes
# Problem 37

# The number 3797 has an interesting property. Being prime itself, it is
# possible to continuously remove digits from left to right, and remain prime
# at each stage: 3797, 797, 97, and 7. Similarly we can work from right to
# left: 3797, 379, 37, and 3.

# Find the sum of the only eleven primes that are both truncatable from left
# to right and right to left.

# NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.

require 'prime'
require 'benchmark'

class Euler37
  def self.solve
    truncatable_primes.inject(:+)
  end

  def self.truncatable_primes
    Prime.each(800000).select(&:truncatable?)
  end
end

class Integer
  def truncatable?
    return false if self < 23

    digits = self.digits

    return false if digits[1..-1].any?(&:even?)

    # Left to right
    0.upto(digits.length - 1) do |i|
      return false unless digits[i..-1].join.to_i.prime?
    end

    # Right to left
    -1.downto(0 - digits.length) do |i|
      return false unless digits[0..i].join.to_i.prime?
    end
    true
  end

  def digits
    self.to_s.split('').map(&:to_i)
  end
end

p Benchmark.measure { puts Euler37.solve }
