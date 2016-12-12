require_relative 'tile'
require 'byebug'
class Board
  attr_accessor :grid
  attr_reader :txt_file

  def initialize(txt_file)
    @grid = Array.new(9) { Array.new(9) }
    @txt_file = txt_file
  end


  def build_board
    lines_arr = File.readlines(txt_file)
    lines_arr.each_with_index do |arr, arr_idx|
      p arr_idx
      arr.split("").each_with_index do |num, num_idx|
        if num.to_i == 0
          @grid[arr_idx][num_idx] =
            Tile.new(default_tile = false, number = "_", pos = [arr_idx, num_idx])
        else
          @grid[arr_idx][num_idx] =
            Tile.new(default_tile = true, number = num.to_i, pos = [arr_idx, num_idx])
        end
      end
    end
  end

  def render
    grid.each do |line|
      p line.map { |i| i.number.to_s }.join(" ")
    end
    return
  end

  def place_number(pos, num)
    if valid_tile?(pos)
      self[*pos].number = num
    else
      raise "Defaulted number"
    end
  end

  def valid_tile?(pos)
    self[*pos].default_tile == false
  end

  def [](x, y)# be sure to use self[*pos]
    @grid[x][y]
  end

  def []=(x, y, value)
    @grid[x][y] = value
  end

  def solved?
    all_possible_solutions = square_arrs + vertical_arrs + horizontal_arrs
    all_possible_solutions.all? { |arr| arr.sort == (1..9).to_a }
    end
  end

  def square_arrs
    num_arr = []
    all_square_coords.each do |arr|
      num_arr << arr.map { |i| (self[*i].number.is_a?(String)) ? 0 : self[*i].number}
    end
    num_arr
  end

  def all_square_coords
    total_arr = []
    total_arr << square_arrs_build(0,3,0,3)
    total_arr << square_arrs_build(0,3,3,6)
    total_arr << square_arrs_build(0,3,6,9)
    total_arr << square_arrs_build(3,6,0,3)
    total_arr << square_arrs_build(3,6,3,6)
    total_arr << square_arrs_build(3,6,6,9)
    total_arr << square_arrs_build(6,9,0,3)
    total_arr << square_arrs_build(6,9,3,6)
    total_arr << square_arrs_build(6,9,6,9)
    total_arr
  end

  def square_arrs_build(range_1_1, range_1_2, range_2_1, range_2_2)
    coords = []
    (range_1_1...range_1_2).each do |idx1|
      (range_2_1...range_2_2).each do |idx2|
        coords << [idx1, idx2]
      end
    end
    coords
  end

  def vertical_arrs
    vertical_arrs = []
    (0..8).each do |idx1|
      sub_arr = []
      (0..8).each do |idx2|
        sub_arr << self[idx2, idx1].number
      end
      vertical_arrs << sub_arr.map { |i| i.is_a?(String) ? 0 : i}
    end
    vertical_arrs
  end

  def horizontal_arrs
    horiz_arrs = []
    @grid.each do |arr|
      horiz_arrs << arr.map { |obj| obj.number.is_a?(String) ? 0 : obj.number }
    end
    horiz_arrs
  end

end
x = Board.new('sudoku1.txt')
x.build_board
x.render
x.place_number([0 ,0], 1)
x.place_number([3,0], 2)
x.place_number([2,0], 3)
x.place_number([5,0], 6)
x.place_number([6,0], 4)
x.place_number([8,0], 5)
x.render
x.solved?
