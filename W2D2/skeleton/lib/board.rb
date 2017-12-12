require 'byebug'
class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14)
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |el, i|
      if i == 6 || i == 13
        @cups[i] = []
      else
        @cups[i] = [:stone, :stone, :stone, :stone]
      end
    end
  end

  def valid_move?(start_pos)
    if start_pos < 1 || start_pos > 14
      raise "Invalid starting cup"
    end
    true
  end

  def make_move(start_pos, current_player_name)
    i = 0
    cur_pos = nil
    until @cups[start_pos].empty?
      # debugger
      i += 1
      cur_pos = (start_pos + i) % 14
      unless (current_player_name == @name1 && cur_pos == 13) ||
             (current_player_name == @name2 && cur_pos == 6)
        @cups[cur_pos] << @cups[start_pos].pop
      end
    end
    render
    next_turn(cur_pos, current_player_name)
  end

  def next_turn(ending_cup_idx, current_player_name)
    # debugger
    # helper method to determine what #make_move returns
    if current_player_name == @name1 && ending_cup_idx < 7 ||
       current_player_name == @name2 && ending_cup_idx > 6
       # on player's side
      :prompt
    elsif @cups[ending_cup_idx].length > 1
      ending_cup_idx
    else
      :switch
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    (0..5).all? { |i| @cups[i].empty? } ||
    (7..12).all? { |i| @cups[i].empty? }
  end

  def winner
    if @cups[6].length > @cups[13].length
      @name1
    elsif @cups[6].length == @cups[13].length
      :draw
    else
      @name2
    end
  end
end
