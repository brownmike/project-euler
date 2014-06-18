# Distinct primes factors
# Problem 47

# The first two consecutive numbers to have two distinct prime factors are:

  # 14 = 2 × 7
  # 15 = 3 × 5

# The first three consecutive numbers to have three distinct prime factors are:

  # 644 = 2² × 7 × 23
  # 645 = 3 × 5 × 43
  # 646 = 2 × 17 × 19.

# Find the first four consecutive integers to have four distinct prime factors.
# What is the first of these numbers?

require 'prime'
require 'benchmark'

class Euler47
  def self.solve
    2.upto(1_000_000) do |i|
      return i if (i..i+3).all? { |n| n.prime_division.length == 4 }
    end
  end
end

p Benchmark.measure { puts Euler47.solve }
