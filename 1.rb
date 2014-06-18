# Problem 1

# If we list all the natural numbers below 10 that are multiples of 3 or 5,
# we get 3, 5, 6 and 9. The sum of these multiples is 23.

# Find the sum of all the multiples of 3 or 5 below 1000.

def sum_multiples_of_3_or_5
  (1..999).to_a.select { |n| n.multiple_of?(3) or n.multiple_of?(5) }.inject(&:+)
end

class Fixnum
  def multiple_of?(n)
    self % n == 0
  end
end
