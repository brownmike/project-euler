# Sub-string divisibility
# Problem 43

# The number, 1406357289, is a 0 to 9 pandigital number because it is made up
# of each of the digits 0 to 9 in some order, but it also has a rather
# interesting sub-string divisibility property.

# Let d1 be the 1st digit, d2 be the 2nd digit, and so on. In this way, we
# note the following:

  # d2d3d4=406 is divisible by 2
  # d3d4d5=063 is divisible by 3
  # d4d5d6=635 is divisible by 5
  # d5d6d7=357 is divisible by 7
  # d6d7d8=572 is divisible by 11
  # d7d8d9=728 is divisible by 13
  # d8d9d10=289 is divisible by 17

# Find the sum of all 0 to 9 pandigital numbers with this property.

require 'benchmark'

class Euler43
  def self.solve
    permutations = [1,0,2,3,4,5,6,7,8,9].permutation(10).map(&:join).map(&:to_i)
    permutations.select do |perm|
      perm.length == 10 && perm.sub_string_divisible?
    end.inject(:+)
  end
end

class Integer
  def pandigital?
    min = 1023456789
    expected = 1023
    num = self

    if num >= min
      digits = 0
      while num > 0
        digits |= 1 << (num - num/10 * 10)
        num /= 10
      end
      return digits == expected
    end
    false
  end

  def sub_string_divisible?
    self.slice(2,4) % 2 == 0 &&
    self.slice(3,5) % 3 == 0 &&
    self.slice(4,6) % 5 == 0 &&
    self.slice(5,7) % 7 == 0 &&
    self.slice(6,8) % 11 == 0 &&
    self.slice(7,9) % 13 == 0 &&
    self.slice(8,10) % 17 == 0
  end

  # 8045.slice(2,4) == 45
  # 92835.slice(1,3) == 928
  def slice(first,last)
    return nil if first > last || last > self
    result = 0
    first.upto(last) do |d|
      result += self.digit(d) * 10**(last-d)
    end
    result
  end

  def length
    (1 + Math.log10(self)).floor
  end

  # Return nth digit of a number
  def digit(num)
    return nil if num > self.length
    result = self
    (length - num).times { result /= 10 }
    result % 10
  end
end

p Benchmark.measure { puts Euler43.solve }
