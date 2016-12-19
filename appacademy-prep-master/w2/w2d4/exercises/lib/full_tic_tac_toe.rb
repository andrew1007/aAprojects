class Board
  attr_reader :grid, :marks
  def initialize
    @symbols = [:X, :O]
    @grid = [[nil,nil,nil], [nil,nil,nil], [nil,nil,nil]]
  end

  def place_mark(x, y, sym)
    @grid.each{|i| @grid[x][y]=sym}
  end

  def empty?(x,y)
    @grid[x][y].nil?
  end

  def over?
    flattened = @grid.flatten
    filled = flattened.map {|i| i.include?(nil)}
    if filled.include? == false
      return true
    else
      return false
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
    while i < straight.length
      if straight[i].uniq == [:X]
        return [true, :X]
      elsif straight[i].uniq == [:O]
        return [true, :O]
      else
        return []
      end
    end
  end

  def horizontal_win
    aligned_straight_win(@grid)
  end

  def vertical_win
    aligned_straight_win(@grind.transpose)
  end

  def diagonal_win
    x = @grid
    if x[0][0] == x[1][1] && x[1][1] == x[2][2]
      return [true, x[0][0]]
    elsif x[2][0] == x[2][0] && x[1][1] == x[0][2]
      return [true, x[2][0]]
    else
      return []
    end
  end
end


#x=Board.new
#x.place_mark(0,0, :O)
#x.place_mark(1,1, :O)
#x.place_mark(2,2, :O)

class HumanPlayer
  attr_reader :name
  attr_accessor :mark

  def initialize
    @name = name
  end

  def get_move(x,y)
    puts "Where would you like to move? (row, col)"
    position = gets.chomp.split(",").map(&:to_i)
  end

  def display(board)
    row0 = "0 |"
    (0..2).each do |col|
      row0 << (board.empty?([0, col]) ? "   |" : " " + board[0, col].to_s + " |")
    end
    row1 = "1 |"
    (0..2).each do |col|
      row1 << (board.empty?([1, col]) ? "   |" : " " + board[1, col].to_s + " |")
    end
    row2 = "2 |"
    (0..2).each do |col|
      row2 << (board.empty?([2, col]) ? "   |" : " " + board[2, col].to_s + " |")
    end
  end
end

class ComputerPlayer
  attr_reader :name, :board
  attr_accessor :mark

  def initialize(name)
    @name = name
  end

  def display(board)
    @board = board
  end

  def get_move
    moves = [] #create array of all possible valid moves
    (0..2).each do |x|
      (0..2).each do |y|
        #push into empty array under the condition
        #that the specified position is currently nil
        if board[x, y].nil?
          moves << [row, col]
        end
      end
    end

    moves.each do |move|
      return move if wins?(move)
    end

    moves.sample
  end

  def wins?(move)
    board[*move] = mark

    if board.winner == mark
      board[*move] = nil
      true
    else
      board[*move] = nil
      false
    end
  end
end

class Game
  attr_accessor :current_player, :player1, :player2, :board

  def initialize(player1, player2)
    @player1, @player2 = player1, player2
    player1.sym = :X
    player2.sym = :O
    @current_player = player1
    @board = Board.new
  end

  def switch_players!
    if @current_player == player1
      @current_player = player2
    elsif @current_player == player2
      @current_player = player1
    end
  end

  def play_turn
    arguments = [@current_player.get_move, @current_player.sym]
    @board.place_mark(*arguments)
    switch_players!
    @board
  end

  def play
    play_turn
    check_for_end_game_or_winner
  end

  def check_for_end_game_or_winner
    if @board.over?
      return "Cat's game"
    elsif @player1.sym == @board.winner
      return player1
    elsif @player2.sym == @board.winner
      return player2
    end
    @board
  end
end
