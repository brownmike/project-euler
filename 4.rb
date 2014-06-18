# Largest palindrome product
# Problem 4

# A palindromic number reads the same both ways. The largest palindrome made
# from the product of two 2-digit numbers is 9009 = 91 × 99.

# Find the largest palindrome made from the product of two 3-digit numbers.

def largest_palindrome_from_product_of_n_digits(n)
  divisors = (('1' + '0' * (n-1)).to_i..('9'*n).to_i).to_a.reverse
  product = divisors.first ** 2
  found = false

  while !found do
    if product.palindrome?
      puts "Testing #{product}"
      divisors.each do |d|
        break if (product / d).digits > n
        if product % d == 0 && (product / d).digits == n
          puts "#{product} = #{d} * #{product / d}"
          return product
        end
      end
      product -= 1
    else
      product -= 1
    end
  end

  product
end

class Fixnum
  def palindrome?
    self.to_s == self.to_s.reverse
  end

  def digits
    self.to_s.size
  end
end
