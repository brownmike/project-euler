# 1000-digit Fibonacci number
# Problem 25

# The Fibonacci sequence is defined by the recurrence relation:

# Fn = Fn−1 + Fn−2, where F1 = 1 and F2 = 1.
# Hence the first 12 terms will be:

# F1 = 1
# F2 = 1
# F3 = 2
# F4 = 3
# F5 = 5
# F6 = 8
# F7 = 13
# F8 = 21
# F9 = 34
# F10 = 55
# F11 = 89
# F12 = 144
# The 12th term, F12, is the first term to contain three digits.

# What is the first term in the Fibonacci sequence to contain 1000 digits?

LIMIT = 10**1000/10

def fib_to_1k_digits(num=1, prev_num=1, term=2)
  return term if num >= LIMIT
  fib_to_1k_digits(num + prev_num, num, term += 1)
end
