# Number spiral diagonals
# Problem 28

# Starting with the number 1 and moving to the right in a clockwise direction
# a 5 by 5 spiral is formed as follows:

# 21 22 23 24 25
# 20  7  8  9 10
# 19  6  1  2 11
# 18  5  4  3 12
# 17 16 15 14 13

# It can be verified that the sum of the numbers on the diagonals is 101.

# What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral
# formed in the same way?

class Euler28
  attr_reader :numbers, :side_length, :current_side

  def initialize
    @numbers = [1,3,5,7,9]
    @side_length = 1
    @current_side = 0
  end

  def generate_diagonals!
    loop do
      break if numbers.last == 1001**2
      next!
    end
  end

  def count
    numbers.count
  end

  def sum
    numbers.inject(:+)
  end

  def next!
    @side_length += 2 if current_side == 0
    number = numbers.last + side_length + 1
    @numbers << number
    @current_side = current_side.next % 4
    number
  end
end
