# Powerful digit sum
# Problem 56

# A googol (10^100) is a massive number: one followed by one-hundred zeros;
# 100^100 is almost unimaginably large: one followed by two-hundred zeros.
# Despite their size, the sum of the digits in each number is only 1.

# Considering natural numbers of the form, a^b, where a, b < 100, what is the
# maximum digital sum?

require 'benchmark'

class Euler56
  def self.solve
    largest = 0
    1.upto(100) do |a|
      1.upto(100) do |b|
        candidate = (a**b).digit_sum
        largest = candidate if candidate > largest
      end
    end
    largest
  end
end

class Integer
  def digit_sum
    self.to_s.split('').map(&:to_i).inject(:+)
  end
end

p Benchmark.measure { puts Euler56.solve }
