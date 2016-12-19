require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game
  attr_accessor :current_player, :player1, :player2, :board

  def initialize(player1, player2)
    @player1, @player2 = player1, player2
    @player1.mark = :X
    @player2.mark = :O
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
    @board.place_mark(@current_player.get_move, @current_player.mark)
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
    #current_player.display(@board)

end
