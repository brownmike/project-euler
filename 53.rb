# Combinatoric selections
# Problem 53

# There are exactly ten ways of selecting three from five, 12345:

# 123, 124, 125, 134, 135, 145, 234, 235, 245, and 345

# In combinatorics, we use the notation, 5C3 = 10.

# In general,

# nCr = n! / (r!(n−r)!)
# where r ≤ n, n! = n×(n−1)×...×3×2×1, and 0! = 1.
# It is not until n = 23, that a value exceeds one-million: 23C10 = 1144066.

# How many, not necessarily distinct, values of  nCr, for 1 ≤ n ≤ 100, are
# greater than one-million?

require 'benchmark'

class Euler53
  def self.solve
    count = 0
    23.upto(100) do |n|
      1.upto(n) do |r|
        count += 1 if combinatoric_selections(n,r) > 1000000
      end
    end
    count
  end

  def self.combinatoric_selections(n,r)
    (n.factorial) / (r.factorial * (n - r).factorial)
  end
end

class Integer
  def factorial
    return 1 if self == 0
    (1..self).inject(:*)
  end
end

p Benchmark.measure { puts Euler53.solve }
