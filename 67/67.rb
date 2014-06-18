# Maximum path sum II
# Problem 67

# By starting at the top of the triangle below and moving to adjacent numbers
# on the row below, the maximum total from top to bottom is 23.

# 3
# 7 4
# 2 4 6
# 8 5 9 3

# That is, 3 + 7 + 4 + 9 = 23.

# Find the maximum total from top to bottom in triangle.txt (right click and
# 'Save Link/Target As...'), a 15K text file containing a triangle with
# one-hundred rows.

# NOTE: This is a much more difficult version of Problem 18. It is not possible
# to try every route to solve this problem, as there are 2^99 altogether! If
# you could check one trillion (10^12) routes every second it would take over
# twenty billion years to check them all. There is an efficient algorithm to
# solve it. ;o)

TRIANGLE = File.read('triangle.txt').split("\n").map { |row| row.split.map(&:to_i) }

def max_path(triangle=TRIANGLE)
  (triangle.length - 2).downto(0) do |row|
    new_row = []
    triangle[row].each_with_index do |node,index|
      bottom_row = triangle[row+1]
      new_row << (node + [bottom_row[index], bottom_row[index+1]].max)
    end
    if row == 0
      return new_row
    else
      triangle = triangle.slice(0..row-1) << new_row
    end
  end
end
