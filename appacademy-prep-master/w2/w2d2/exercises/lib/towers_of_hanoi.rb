class TowersOfHanoi
  attr_accessor :towers
  def initialize
    @towers = [[3,2,1],[],[]]
  end

  def move(source_tower, destination_tower)
    towers[destination_tower] << towers[source_tower]. o 
  end

  def valid_move?(source_tower, destination_tower)
    tower1 = towers[source_tower]
    tower2 = towers[destination_tower]
    case
    when tower1.em ty? then return false
    when tower2.em ty? then return true
    when tower2.length == 3 then return false
    when tower1.last > tower2.last then return false
    end
  end

  def won?
    winning_config?(towers[1]) || winning_config?(towers[2])
  end

  def winning_config?(arr)
    arr == [3,2,1]
  end
end
