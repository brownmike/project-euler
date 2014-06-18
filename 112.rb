# Bouncy numbers
# Problem 112

# Working from left-to-right if no digit is exceeded by the digit to its left
# it is called an increasing number; for example, 134468.

# Similarly if no digit is exceeded by the digit to its right it is called a
# decreasing number; for example, 66420.

# We shall call a positive integer that is neither increasing nor decreasing
# a "bouncy" number; for example, 155349.

# Clearly there cannot be any bouncy numbers below one-hundred, but just over
# half of the numbers below one-thousand (525) are bouncy. In fact, the least
# number for which the proportion of bouncy numbers first reaches 50% is 538.

# Surprisingly, bouncy numbers become more and more common and by the time we
# reach 21780 the proportion of bouncy numbers is equal to 90%.

# Find the least number for which the proportion of bouncy numbers is
# exactly 99%.

require 'benchmark'

class Euler112
  def self.solve
    count = 0.9 * 21780
    21781.upto(Float::INFINITY) do |num|
      count += 1 if num.bouncy?
      return num if count/num >= 0.99
    end
  end
end

class Integer
  def bouncy?
    return false if length < 3
    last_digit = digit 1
    order = 'unknown'
    2.upto(length) do |n|
      curr_digit = digit n
      case order
      when 'asc'
        return true unless curr_digit >= last_digit
      when 'desc'
        return true unless curr_digit <= last_digit
      when 'unknown'
        if curr_digit > last_digit
          order = 'asc'
        elsif curr_digit < last_digit
          order = 'desc'
        end
      end
      last_digit = curr_digit
    end
    false
  end

  def length
    (1 + Math.log10(self)).floor
  end

  def digit(num)
    return nil if num > self.length
    result = self
    (length - num).times { result /= 10 }
    result % 10
  end
end

p Benchmark.measure { puts Euler112.solve }
