# Reciprocal cycles
# Problem 26

# A unit fraction contains 1 in the numerator. The decimal representation of
# the unit fractions with denominators 2 to 10 are given:

# 1/2	= 	0.5
# 1/3	= 	0.(3)
# 1/4	= 	0.25
# 1/5	= 	0.2
# 1/6	= 	0.1(6)
# 1/7	= 	0.(142857)
# 1/8	= 	0.125
# 1/9	= 	0.(1)
# 1/10	= 	0.1

# Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle. It can be
# seen that 1/7 has a 6-digit recurring cycle.

# Find the value of d < 1000 for which 1/d contains the longest recurring cycle
# in its decimal fraction part.

# Just needed to check the largest primes < 1000
# => 983

# Doesn't handle zeros correctly but seems to get the length correct =X
def get_repeating_digits(denom,numer=1)
  digits = [(numer*10)/denom]
  remainders = [(numer*10)%denom]

  loop do
    dividend = remainders.last * 10
    digits << dividend / denom
    remainder = dividend % denom
    if remainders.include? remainder
      return digits[remainders.index(remainder)+1..-1].join
    else
      remainders << remainder
    end
  end
end
