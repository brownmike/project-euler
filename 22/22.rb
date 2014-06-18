# Names scores
# Problem 22

# Using names.txt, a 46K text file containing over five-thousand first names,
# begin by sorting it into alphabetical order. Then working out the alphabetical
# value for each name, multiply this value by its alphabetical position in the
# list to obtain a name score.

# For example, when the list is sorted into alphabetical order, COLIN, which is
# worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN
# would obtain a score of 938 × 53 = 49714.

# What is the total of all the name scores in the file?

require 'benchmark'

class Euler22
  def self.solve
    names = File.read('names.txt').delete('"').split(',').sort
    names.each_with_index.map { |n,i| n.value * (i + 1) }.inject(:+)
  end
end

class String
  def value
    self.sum - (64 * self.length)
  end
end

p Benchmark.measure { puts Euler22.solve }
