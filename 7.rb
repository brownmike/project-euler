# 10001st prime
# Problem 7

# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see
# that the 6th prime is 13.

# What is the 10,001st prime number?

def list_nth_prime(n)
  count = 0
  num = 2

  while count < n do
    if num.prime?
      count += 1
      return num if count == n
    end
    num += 1
  end
end

class Fixnum
  def prime?
    return false if self < 2

    i = 2
    limit = self / 2
    while i <= limit do
      return false if self % i == 0
      i > 2 ? i += 2 : i += 1
    end
    true
  end
end
