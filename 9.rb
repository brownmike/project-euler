# Special Pythagorean triplet
# Problem 9

# A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
# a2 + b2 = c2

# For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.

# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

def find_pythagorean_triplet
  a_nums = (1..1000).to_a
  b_nums = (1..1000).to_a

  a_nums.each do |a|
    b_nums.each do |b|
      c = Math.sqrt(a**2 + b**2)
      if a + b + c == 1000
        puts "#{a}^2 + #{b}^2 = #{c}^2"
        return a * b * c
      end
    end
  end
end
