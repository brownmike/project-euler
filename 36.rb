# Double-base palindromes
# Problem 36

# The decimal number, 585 = 1001001001 (binary), is palindromic in both bases.

# Find the sum of all numbers, less than one million, which are palindromic
# in base 10 and base 2.

# Please note that the palindromic number, in either base, may not include
# leading zeros.

class String
  def palindrome?
    self == self.reverse
  end
end

class Integer
  def palindrome?
    self.to_s == self.to_s.reverse
  end
end

puts (1..999_999).select { |n| n.palindrome? && n.to_s(2).palindrome? }.inject(:+)
