# Amicable numbers
# Problem 21

# Let d(n) be defined as the sum of proper divisors of n (numbers less than n
# which divide evenly into n).

# If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and
# each of a and b are called amicable numbers.

# For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55
# and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71
# and 142; so d(284) = 220.

# Evaluate the sum of all the amicable numbers under 10000.

puts (1..9999).select { |n| n.amicable? }.inject(:+)

class Fixnum
  def amicable?
    factor_sum_1 = self.proper_divisors.inject(:+)
    factor_sum_2 = factor_sum_1.proper_divisors.inject(:+)
    self == factor_sum_2 && self != factor_sum_1
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
