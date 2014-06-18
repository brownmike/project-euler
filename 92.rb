# Square digit chains
# Problem 92

# A number chain is created by continuously adding the square of the digits in
# a number to form a new number until it has been seen before.

# For example,

# 44 → 32 → 13 → 10 → 1 → 1
# 85 → 89 → 145 → 42 → 20 → 4 → 16 → 37 → 58 → 89

# Therefore any chain that arrives at 1 or 89 will become stuck in an endless
# loop. What is most amazing is that EVERY starting number will eventually
# arrive at 1 or 89.

# How many starting numbers below ten million will arrive at 89?
# => 8581146

def solve_long_way
  1.upto(10_000_000).select { |n| n.square_digit_chain.last == 89 }.count
end

# Really long
class Euler92
  attr_reader :numbers, :current, :limit, :ones

  def initialize(limit=(7*9*9))
    @current = 1
    @limit = limit
    @numbers = []
    @ones = []
  end

  def solve
    1.upto(limit) do |n|
      @current = n
      unless numbers.include?(current) || ones.include?(current)
        calculate_next
      end
    end
    numbers.count
  end

  def calculate_next
    chain = [current]
    loop do
      # Save all numbers in the chain & their permutations
      if chain.last == 89
        permutations = chain.map { |n| n.digits.permutation.to_a.map(&:join) }
        @numbers.push(permutations).flatten!.uniq!

      # Discard
      elsif chain.last == 1
        return

      # Calculate the sum of digits squared
      else
        chain << chain.last.sum_of_digits_squared
      end
    end
  end
end

class Integer
  def square_digit_chain
    chain = [self]
    loop do
      return chain if chain.last == 1 or chain.last == 89
      chain << chain.last.sum_of_digits_squared
    end
    return chain
  end

  def sum_of_digits_squared
    number = self
    total = 0
    loop do
      return total if number == 0
      total += (number % 10)**2
      number /= 10
    end
  end

  def digits
    self.to_s.split('').map(&:to_i)
  end
end
