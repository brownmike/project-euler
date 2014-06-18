# Integer right triangles
# Problem 39

# If p is the perimeter of a right angle triangle with integral length sides,
# {a,b,c}, there are exactly three solutions for p = 120.

# {20,48,52}, {24,45,51}, {30,40,50}

# For which value of p ≤ 1000, is the number of solutions maximised?

require 'benchmark'

class Euler39
  def self.solve
    solutions = {}
    (12..1000).each do |p|
      solutions[p] = p.right_triangle_solutions.count
    end
    solutions.max_by { |k,v| v }.first
  end
end

class Integer
  # a = P( (P - 2b)/(2(P - b)) )
  def right_triangle_solutions
    solutions = []
    3.upto(self/4) do |b|
      a = self * ( (self-2.0*b)/(2.0*(self-b)) )
      if a % 1 == 0
        solutions << [a,b,self-(a+b)]
      end
    end
    solutions
  end
end

p Benchmark.measure { puts Euler39.solve }
