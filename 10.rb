# Summation of primes
# Problem 10

# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

# Find the sum of all the primes below two million.

require 'prime'

def primes_under(num)
  range = (2..num-1).to_a
  range.select { |n| n.prime? }
end

primes_under(2000000).inject(&:+)
