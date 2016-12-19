class Board
  attr_accessor :grid

  def initialize(grid = self.class.default_grid)
    @grid = grid
  end

  def self.default_grid
    Array.new(10) {Array.new(10)}
  end

  def size
    @grid.length
  end

  def won?
    if completely_empty?
      return true
    else
      return false
    end
  end

  def display
    col_names = (0..9).to_a.join(" ")
    i = 0
    while i < col_names.length
      row = @grid[i].join(" ")
      p "#{col_names[i]} #{row}"
      i += 1
    end
  end

  def count
    count = 0
    @grid.flatten.each do |coord|
      (coord != nil)? count += 1 : coord
    end
    count
  end

  def place_random_ship
    raise "full" if full?
    nums = grid[0].length
    coord = [rand(nums), rand(nums)]
    until empty?(coord) == true
      coord = [rand(nums), rand(nums)]
    end
    x = coord[0]
    y = coord[1]
    @grid[x][y] = :ship
  end

  def completely_empty?
    @grid.flatten.each do |pos|
      return false if !pos.nil?
    end
    return true
  end

  def empty?(coord = nil)
    if coord == nil
      return completely_empty?
    else
      x = coord[0]
      y = coord[1]
      return @grid[x][y].nil?
    end
  end

  def full?
    @grid.flatten.each do |pos|
      return false if pos.nil?
    end
    return true
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, val)
    x, y = pos
    @grid[x][y] = val
  end
end
