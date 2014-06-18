# Lexicographic permutations
# Problem 24

# A permutation is an ordered arrangement of objects. For example, 3124 is one
# possible permutation of the digits 1, 2, 3 and 4. If all of the permutations
# are listed numerically or alphabetically, we call it lexicographic order. The
# lexicographic permutations of 0, 1 and 2 are:

# 012   021   102   120   201   210

# What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4,
# 5, 6, 7, 8 and 9?

# The following algorithm generates the next permutation lexicographically after
# a given permutation. It changes the given permutation in-place.
#
# 1) Find the largest index k such that a[k] < a[k + 1]. If no such index
#    exists, the permutation is the last permutation.
# 2) Find the largest index l such that a[k] < a[l].
# 3) Swap the value of a[k] with that of a[l].
# 4) Reverse the sequence from a[k + 1] up to and including the final element
#    a[n].

# For example, given the sequence [1, 2, 3, 4] which starts in a weakly
# increasing order, and given that the index is zero-based, the steps are as
# follows:

# 1) Index k = 2, because 3 is placed at an index that satisfies condition of
#    being the largest index that is still less than a[k + 1] which is 4.
# 2) Index l = 3, because 4 is the only value in the sequence that is greater
#    than 3 in order to satisfy the condition a[k] < a[l].
# 3) The values of a[2] and a[3] are swapped to form the new sequence [1,2,4,3].
# 4) The sequence after k-index a[2] to the final element is reversed. Because
#    only one value lies after this index (the 3), the sequence remains
#    unchanged in this instance. Thus the lexicographic successor of the initial
#    state is permuted: [1,2,4,3].

# Following this algorithm, the next lexicographic permutation will be
# [1,3,2,4], and the 24th permutation will be [4,3,2,1] at which point
# a[k] < a[k + 1] does not exist, indicating that this is the last permutation.

# Easy mode ruby
class Integer
  def get_nth_permutation(n)
    digits = self.to_s.split('').map(&:to_i).sort
    digits.permutation.to_a.sort[n-1].join.to_i
  end
end

# Slow - Algorithm found on Wikipedia
class Permutation
  attr_reader :current, :count

  def initialize(number)
    @current = number.to_s.split('').sort.join
    @count = 1
  end

  def digits
    current.split('').map(&:to_i)
  end

  def next
    a = digits

    # 1) Find the largest index k such that a[k] < a[k + 1]. If no such index
    #    exists, the permutation is the last permutation.
    k = get_k
    return current unless k

    # 2) Find the largest index l such that a[k] < a[l].
    l = get_l(k)

    # 3) Swap the value of a[k] with that of a[l].
    a[k] ^= a[l]
    a[l] ^= a[k]
    a[k] ^= a[l]

    # 4) Reverse the sequence from a[k + 1] up to and including the final
    #    element a[n].
    sequence_1 = a.slice(0..k)
    sequence_2 = a.slice(k+1..-1).reverse
    @count += 1
    @current = (sequence_1 + sequence_2).join
  end

  def get_l(k)
    a = digits
    slice = a.slice(k..-1).reverse
    slice.each do |num|
      if num > a[k]
        return a.index(num)
      end
    end
  end

  def get_k
    a = digits
    a_reverse = a.reverse
    a_reverse.each_with_index do |num,i|
      if num > a_reverse[i+1]
        return a.index(a_reverse[i+1])
      end
    end
    nil
  end
end
