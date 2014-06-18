# Pandigital prime
# Problem 41

# We shall say that an n-digit number is pandigital if it makes use of all the
# digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital and
# is also prime.

# What is the largest n-digit pandigital prime that exists?

require 'prime'
require 'benchmark'

class Euler41
  def self.solve
    [1,2,3,4,5,6,7].permutation.map(&:join).map(&:to_i).select(&:prime?).max
  end
end

class Integer
  def pandigital?
    digits.sort == (1..(digits.length)).to_a
  end

  def digits
    self.to_s.split('').map(&:to_i)
  end
end

p Benchmark.measure { puts Euler41.solve }
