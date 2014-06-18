# Circular primes
# Problem 35

# The number, 197, is called a circular prime because all rotations of the
# digits: 197, 971, and 719, are themselves prime.

# There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37,
# 71, 73, 79, and 97.

# How many circular primes are there below one million?

require 'prime'

def euler35
  p = CircularPrimes.new 10_000_000
  puts p.count
end

class CircularPrimes
  attr_reader :numbers

  def initialize(limit)
    @numbers = generate(limit)
  end

  def count
    numbers.count
  end

  def generate(limit)
    Prime.each(limit).select { |prime| circular?(prime) }
  end

  def circular?(prime)
    digits = prime.digits
    return false unless digits.all? { |d| d.odd? } || prime == 2
    rotations = digits.length - 1
    rotations.times do
      digits.rotate!
      return false unless digits.join.to_i.prime?
    end
    true
  end
end

class Integer
  def digits
    self.to_s.split('').map(&:to_i)
  end
end
