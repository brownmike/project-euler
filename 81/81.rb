# Path sum: two ways
# Problem 81

# In the 5 by 5 matrix below, the minimal path sum from the top left to the
# bottom right, by only moving to the right and down, is indicated with ^
# and is equal to 2427.

  # ^131	 673	 234	 103	018
  # ^201	^096	^342	 965	150
  #  630	 803	^746	^422	111
  #  537	 699	 497	^121	956
  #  805	 732	 524	^037	^331

# Find the minimal path sum, in matrix.txt, a 31K text file containing an
# 80 by 80 matrix, from the top left to the bottom right by only moving
# right and down.

require 'benchmark'

#MATRIX = File.read('matrix.txt').split("\n").map { |row| row.split(',').map(&:to_i) }

TEST = [
  [131,673,234,103,18],
  [201,96,342,965,150],
  [630,803,746,422,111],
  [537,699,497,121,956],
  [805,732,524,37,331]
]

# I traverse the matrix in this fashion:

#           131
#         201 673
#       630 096 234
#     537 803 342 103
#   805 699 746 965 018
#     732 497 422 150
#       524 121 111
#         037 956
#           331

class Euler81
  class << self
    def solve(grid)
      Matrix.new(grid).min_diag_sum_path
    end
  end
end

class Matrix
  attr_reader :grid

  def initialize(grid)
    @grid = grid
  end

  def min_diag_sum_path
    limit = grid.length - 1
    prev_row = get_diagonal_row(0,0)

    1.upto(limit) do |row|
      # Calculate top half path
      curr_row = get_diagonal_row(row,0)
      prev_row = calculate_min_row(prev_row,curr_row)
    end

    1.upto(limit) do |col|
      # Calculate bottom half path
      curr_row = get_diagonal_row(limit,col)
      prev_row = calculate_min_row(prev_row,curr_row)
    end

    prev_row.min
  end

  def calculate_min_row(top_row,bot_row)
    min_row = []
    if top_row.length < bot_row.length
      # TODO
    else
      # TODO
    end
  end

  def get_diagonal_row(start_row,start_col)
    new_row = []
    if start_col == 0
      # Top half
      col = 0
      start_row.downto(0) do |row|
        new_row << grid[row][col]
        col += 1
      end
    else
      # Bottom half
      row = grid.length - 1
      start_col.upto(grid.length - 1) do |col|
        new_row << grid[row][col]
        row -= 1
      end
    end
    return new_row
  end
end

#p Benchmark.measure { puts Euler81.solve(TEST) }
