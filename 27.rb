# Quadratic primes
# Problem 27

# Euler discovered the remarkable quadratic formula:

  # n² + n + 41

# It turns out that the formula will produce 40 primes for the consecutive
# values n = 0 to 39. However, when n = 40, 40² + 40 + 41 = 40(40 + 1) + 41
# is divisible by 41, and certainly when n = 41, 41² + 41 + 41 is clearly
# divisible by 41.

# The incredible formula  n² − 79n + 1601 was discovered, which produces 80
# primes for the consecutive values n = 0 to 79. The product of the
# coefficients, −79 and 1601, is −126479.

# Considering quadratics of the form:

  # n² + an + b, where |a| < 1000 and |b| < 1000

  # where |n| is the modulus/absolute value of n
  # e.g. |11| = 11 and |−4| = 4

# Find the product of the coefficients, a and b, for the quadratic expression
# that produces the maximum number of primes for consecutive values of n,
# starting with n = 0.

require 'prime'

def euler27
  expressions = []

  (-999).upto(999) do |a|
    if a.odd?
      Prime.each(999) do |b|
        expression = {a: a, b: b, count: 0}
        n = 0
        loop do
          result = (n**2 + a * n + b)
          break unless result.prime?
          expression[:count] += 1
          n += 1
        end
        expressions << expression
      end
    end
  end

  max = expressions.map { |e| e[:count] }.max
  expression = expressions.select { |e| e[:count] == max }.first
  p expression
  return expression[:a] * expression[:b]
end
