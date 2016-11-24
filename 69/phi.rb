require 'benchmark'
require 'prime'

def totient_maximum(limit)
  return nil unless limit > 1

  Prime.reduce do |accumulator, prime|
    break accumulator if prime * accumulator >= limit
    accumulator * prime
  end
end

class Integer
  def relative_primes
    1.upto(self - 1).select do |candidate|
      gcd(candidate) == 1
    end
  end

  def phi
    relative_primes.count
  end

  def n_to_phi_ratio
    to_f / phi
  end
end

if ARGV.first == 'solve'
  limit = ARGV[1]
  p Benchmark.measure { puts totient_maximum(limit.to_i) }
end
