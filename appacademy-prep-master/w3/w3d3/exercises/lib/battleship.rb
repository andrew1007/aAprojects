class BattleshipGame
  attr_reader :board, :player, :hit

  def initialize(player = HumanPlayer.new("Andrew"), board = Board.new)
    @player = player
    @board = board
  end

  def count
    @board.count
  end

  def game_over?
    @board.won?
  end

  def attack(coord)
    @board[coord] = :x
  end

  def play_turn
    coords = @player.get_play
    attack(coords)
  end
end
