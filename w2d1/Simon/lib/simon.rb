class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @seq = []
    @sequence_length = 1
    @game_over = false
  end

  def play
    take_turn
    if game_over
      game_over_message
      reset_game
    end
    play while !game_over
  end

  def take_turn
    show_sequence
    human_entry = gets.chomp
    if seq.to_s == human_entry
      round_success_message
      add_random_color
    else
      @game_over = true
    end
    @sequence_length += 1

  end

  def show_sequence
    add_random_color
    p seq
  end

  def require_sequence
    gets
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    "correct"
  end

  def game_over_message
    "yah goofed"
  end

  def reset_game
    @seq = []
    @sequence_length = 1
    @game_over = false
  end
end

x = Simon.new
