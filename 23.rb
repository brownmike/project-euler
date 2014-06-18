# Non-abundant sums
# Problem 23

# A perfect number is a number for which the sum of its proper divisors is
# exactly equal to the number. For example, the sum of the proper divisors of
# 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.
#
# A number n is called deficient if the sum of its proper divisors is less than
# n and it is called abundant if this sum exceeds n.
#
# As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest
# number that can be written as the sum of two abundant numbers is 24. By
# mathematical analysis, it can be shown that all integers greater than 28123
# can be written as the sum of two abundant numbers. However, this upper limit
# cannot be reduced any further by analysis even though it is known that the
# greatest number that cannot be expressed as the sum of two abundant numbers
# is less than this limit.
#
# Find the sum of all the positive integers which cannot be written as the sum
# of two abundant numbers.

class NonAbundantSums
  attr_reader :abundants
  UPPER_BOUND = 28123
  LOWER_BOUND = 12

  def initialize
    @abundants = (LOWER_BOUND..UPPER_BOUND).select(&:abundant?)
  end

  def all
    abundant_sums = abundants.each_with_index.map do |a1,i|
      abundants.slice(i..-1).map do |a2|
        a1 + a2
      end
    end.flatten
    (1..UPPER_BOUND).to_a - abundant_sums
  end
end

class Fixnum
  def abundant?
    self.proper_divisors.inject(:+) > self
  end

  def proper_divisors
    divisors = []
    limit = Math.sqrt(self)
    1.upto(limit) do |n|
      if self % n == 0
        divisors << n
        if self / n != n
          divisors << (self / n)
        end
      end
    end
    divisors.delete self unless self == 1
    divisors
  end
end

puts NonAbundantSums.new.all.inject(:+)
