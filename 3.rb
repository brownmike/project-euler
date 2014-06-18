# Largest prime factor
# Problem 3
# The prime factors of 13195 are 5, 7, 13 and 29.

# What is the largest prime factor of the number 600851475143 ?

class Fixnum
  def largest_prime_factor
    return self if prime?
    prime_factorization.max
  end

  def prime_factorization
    return self if prime?
    primes = []
    curr_num = self
    curr_prime = 2

    while !(curr_num.prime?) do
      if curr_num % curr_prime == 0
        primes << curr_prime
        curr_num /= curr_prime
      else
        curr_prime = curr_prime.next_prime
      end
    end
    primes << curr_num
    primes
  end

  def prime?
    return false if self < 2

    i = 2
    while i <= (self / 2) do
      return false if self % i == 0
      i += 1
    end
    true
  end

  def next_prime
    i = self + 1
    while !(i.prime?) do
      i += 1
    end
    i
  end
end
