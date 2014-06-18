# Champernowne's constant
# Problem 40

# Champernowne's constant is an irrational decimal fraction created by
# concatenating the positive integers:

# 0.123456789101112131415161718192021...

# It can be seen that the 12th digit of the fractional part is 1.

# If dn represents the nth digit of the fractional part, find the value of
# the following expression:

# d1 × d10 × d100 × d1000 × d10000 × d100000 × d1000000
# => 210

def euler40
  ns = [1,10,100,1000,10000,100000,1000000]
  ns.map { |n| Champernowne.digit(n-1).to_i }.inject(:*)
end

class Champernowne
  @@digits = '1'
  @@last = '1'

  def self.digit(num)
    while @@digits[num].nil?
      @@digits += @@last.next
      @@last = @@last.next
    end
    @@digits[num]
  end
end
