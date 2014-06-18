# Smallest multiple
# Problem 5

# 2520 is the smallest number that can be divided by each of the numbers
# from 1 to 10 without any remainder.

# What is the smallest positive number that is evenly divisible by all of
# the numbers from 1 to 20?

def lcm(*nums)
  increment = nums.last
  candidate = nums[-2] * increment

  while true do
    if nums.all? { |n| candidate % n == 0 }
      return candidate
    else
      candidate += increment
    end
  end
end
