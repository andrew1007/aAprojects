#require 'Board'

class ComputerPlayer
  attr_reader :name, :board
  attr_accessor :mark

  def initialize(name)
    @name = name
  end

  def get_move
    moves = [] #create array of all possible valid moves
    range = (0..2).to_a
    range.each do |x|
      range.each do |y|
        moves << [x, y] if board[x, y].nil?
      end
    end

    moves.each do |move|
      return move if winning_move(move)
    end

    return moves.sample
  end


  def winning_move(move)
    board.place_mark(move, mark)
    if board.winner
      board.place_mark(move, nil)
      return true
    end
    board.place_mark(move, nil)
  end

  def display(board)
    @board = board
  end
end

#comp = ComputerPlayer.new("john", :X)
#comp.place_mark([0, 0], :X)
#comp.place_mark([1, 1], :X)
#comp.get_move
#comp.grid
