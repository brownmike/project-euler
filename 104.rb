# Pandigital Fibonacci ends
# Problem 104

# The Fibonacci sequence is defined by the recurrence relation:

  # Fn = Fn−1 + Fn−2, where F1 = 1 and F2 = 1.

# It turns out that F541, which contains 113 digits, is the first Fibonacci
# number for which the last nine digits are 1-9 pandigital (contain all the
# digits 1 to 9, but not necessarily in order). And F2749, which contains 575
# digits, is the first Fibonacci number for which the first nine digits are
# 1-9 pandigital.

# Given that Fk is the first Fibonacci number for which the first nine digits
# AND the last nine digits are 1-9 pandigital, find k.

require 'benchmark'

class Euler104
  class << self
    def solve
      fib = Fibonacci.new(2749)
      loop do
        return fib.i if pandigital_ends?(fib.current)
        fib.next
      end
    end

    def pandigital_ends?(n)
      last_9(n).pandigital? && first_9(n).pandigital?
    end

    def first_9(n)
      n / 10**(n.length - 9)
    end

    def last_9(n)
      n % 1000000000
    end
  end
end

class Fibonacci
  attr_reader :current, :last, :i

  def initialize(seed)
    @current = nil
    @last = nil
    @i = 0
    seed.times { self.next }
  end

  def next
    if current.nil?
      @current = 1
    elsif last.nil?
      @last = 1
    else
      n = current + last
      @last = current
      @current = n
    end
    @i += 1
    current
  end
end

class Integer
  # http://stackoverflow.com/questions/2484892/fastest-algorithm-to-check-if-a-number-is-pandigital#2485016
  def pandigital?
    n = self
    digits = 0
    count = 0
    temp = 0

    # n = 12 (1100)
    # temp = 0
    # digits = 0 | 0001 << (12 % 10 - 1)
    # digits = 0 | 0001 << 1
    # digits = 0010
    # 0 == 2 ? Nope
    # count = 1
    # n = 1
    # ----------------------
    # temp = 2 (0010)
    # digits = 0010 | 0001 << (1 % 10 - 1)
    # digits = 0010 | 0001 << 0
    # digits = 0011
    # 2 == 3 ? Nope
    # count = 2
    # n = 0
    # ---------------------
    # 3 == (0001 << 2) - 1 ?
    # 3 == 0100 - 1 ?
    # 3 == 0011 ? Yup 12 is a PandigiPal
    while n > 0 do
      temp = digits
      digits |= 1 << (n % 10 - 1)
      return false if temp == digits
      count += 1
      n /= 10
    end
    digits == (1 << count) - 1
  end

  def length
    (1 + Math.log10(self)).floor
  end
end

p Benchmark.measure { puts Euler104.solve }
