# Lattice paths
# Problem 15

# Starting in the top left corner of a 2×2 grid, and only being able to move
# to the right and down, there are exactly 6 routes to the bottom right corner.

# How many such routes are there through a 20×20 grid?

class LatticeGrid
  def initialize(rows,cols)
    @rows = rows
    @cols = cols
  end

  def paths
    (@rows + @cols).factorial / @rows.factorial / @cols.factorial
  end
end

class Integer
  def factorial
    (1..self).inject(:*) || 1
  end
end
