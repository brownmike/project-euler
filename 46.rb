# Goldbach's other conjecture
# Problem 46

# It was proposed by Christian Goldbach that every odd composite number can be
# written as the sum of a prime and twice a square.

  # 9 = 7 + 2×1^2
  # 15 = 7 + 2×2^2
  # 21 = 3 + 2×3^2
  # 25 = 7 + 2×3^2
  # 27 = 19 + 2×2^2
  # 33 = 31 + 2×1^2

# It turns out that the conjecture was false.

# What is the smallest odd composite that cannot be written as the sum of a
# prime and twice a square?

require 'prime'
require 'benchmark'

class Euler46
  def self.solve
    n = 35
    loop do
      unless n.prime?
        return n unless n.has_goldbach_conjecture?
      end
      n += 2
    end
  end
end

class Integer
  def has_goldbach_conjecture?
    unless prime?
      Prime.each(self) do |prime|
        return true if Math.sqrt((self - prime)/2) % 1 == 0
      end
    end
    false
  end
end

p Benchmark.measure { puts Euler46.solve }
