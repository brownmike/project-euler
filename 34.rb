# Digit factorials
# Problem 34

# 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.

# Find the sum of all numbers which are equal to the sum of the factorial
# of their digits.

# Note: as 1! = 1 and 2! = 2 are not sums they are not included.

# => 40730

HI_BOUND = 10**6
LO_BOUND = 3

puts (LO_BOUND..HI_BOUND).select { |n| n.digit_factorial_sum == n }.inject(:+)

class Integer
  def digit_factorial_sum
    digits.map { |n| n.factorial }.inject(:+)
  end

  def factorial
    return 1 if self == 0
    (1..self).inject(:*)
  end

  def digits
    self.to_s.split('').map(&:to_i)
  end
end
