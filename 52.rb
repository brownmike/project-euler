# Permuted multiples
# Problem 52

# It can be seen that the number, 125874, and its double, 251748, contain
# exactly the same digits, but in a different order.

# Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x, and 6x,
# contain the same digits.

require 'benchmark'

class Euler52
  def self.solve
    num = 125874
    loop do
      break if num.permuted_multiple?(6)
      num += 1
    end
    num
  end
end

class Integer
  def permuted_multiple?(cofactor)
    2.upto(cofactor) do |c|
      return false unless digits.sort == (self * c).digits.sort
    end
    true
  end

  def digits
    self.to_s.split('').map(&:to_i)
  end
end

p Benchmark.measure { puts Euler52.solve }
