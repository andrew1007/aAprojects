class Board
  attr_reader :grid, :marks
  def initialize(grid = Array.new(3) { Array.new(3) })
    @symbols = [:X, :O]
    @grid = grid
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos , value)
    x, y = pos
    @grid[x][y] = value
  end

  def place_mark(x, sym)
     self[x] = sym
     winner
  end

  def empty?(x)
    self[x].nil?
  end

  def over?
    return true if winner == :X || winner == :O

    if @grid.flatten.include?(nil)
      return false
    else
      return true
    end
  end

  def winner
    if self.horizontal_win[0]
      return self.horizontal_win[1]
    elsif self.vertical_win[0]
      return self.vertical_win[1]
    elsif self.diagonal_win[0]
      return self.diagonal_win[1]
    else
      return
    end
  end

  def aligned_straight_win(straight)
    i=0
    xo = [[:X, :X, :X], [:O, :O, :O]]
    straight.each do |row|
      xo.each do |mark|
        return [true, mark[0]] if row == mark
      end
    end
    return []
  end

  def horizontal_win
    #x = self
    aligned_straight_win(@grid)
  end

  def vertical_win
    x = self
    transpose, subarr1, subarr2, subarr3= [], [], [], []
    i = 0
    3.times do
      subarr1 << self[i, 0]
      subarr2 << self[i, 1]
      subarr3 << self[i, 2]
      i += 1
    end
    transpose << subarr1 << subarr2 << subarr3
    aligned_straight_win(transpose)
  end

  def diagonal_win
    x = self
    if x[0, 0] == x[1, 1] && x[1, 1] == x[2, 2]
      return [true, x[0, 0]]
    elsif x[2, 0] == x[2, 0] && x[1, 1] == x[0, 2]
      return [true, x[2, 0]]
    else
      return []
    end
  end
end
