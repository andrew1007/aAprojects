class Player
  attr_accessor :loss_count, :name
  def initialize(name)
    @name = name
    @loss_count = 0
  end

  def guess
    gets.chomp
  end

  def alert_invalid_guess(str)
    !valid_play?(str)
  end
end
