# Coded triangle numbers
# Problem 42

# The nth term of the sequence of triangle numbers is given by, t(n) = ½n(n+1);
# so the first ten triangle numbers are:

  # 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

# By converting each letter in a word to a number corresponding to its
# alphabetical position and adding these values we form a word value. For
# example, the word value for SKY is 19 + 11 + 25 = 55 = t10. If the word
# value is a triangle number then we shall call the word a triangle word.

# Using words.txt, a 16K text file containing nearly two-thousand common
# English words, how many are triangle words?
# => 162

require 'benchmark'

p Benchmark.measure { Euler42.new.solve }

class Euler42
  def initialize
    @words = File.read('words.txt').gsub('"','').split(',').map(&:downcase)
    t = TriangleNumbers.new
    (26*14).times { t.next }
    @numbers = t.numbers
  end

  def solve
    count = 0
    @words.each do |word|
      count += 1 if @numbers.include?(word.word_value)
    end
    puts count
    count
  end
end

class TriangleNumbers
  attr_reader :numbers

  def initialize
    @numbers = [1]
    @i = 1
  end

  def next
    @numbers << numbers.last + @i.next
    @i += 1
    numbers.last
  end
end

class String
  def word_value
    self.split('').map { |c| c.ord - 96 }.inject(:+)
  end
end
