# Longest Collatz sequence
# Problem 14

# The following iterative sequence is defined for the set of positive integers:
# n → n/2 (n is even)
# n → 3n + 1 (n is odd)

# Using the rule above and starting with 13, we generate the following sequence:
# 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1

# It can be seen that this sequence (starting at 13 and finishing at 1)
# contains 10 terms. Although it has not been proved yet (Collatz Problem),
# it is thought that all starting numbers finish at 1.

# Which starting number, under one million, produces the longest chain?

# NOTE: Once the chain starts the terms are allowed to go above one million.

class Fixnum
  def collatz_sequence
    sequence = [self]
    current = self

    loop do
      if current == 1
        return sequence
      elsif current.even?
        sequence << (current / 2)
        current = sequence.last
      elsif current.odd?
        sequence << (3 * current + 1)
        current = sequence.last
      end
    end
  end
end

def longest_sequence_under(num)
  current_count = 0
  winning_number = nil
  (num-1).downto(1) do |n|
    if n.odd?
      candidate = n.collatz_sequence.count
      if candidate > current_count
        current_count = candidate
        winning_number = n
      end
    end
  end
  puts "#{winning_number} has the longest Collatz sequence under #{num} with #{current_count} numbers in the chain"
  winning_number
end
