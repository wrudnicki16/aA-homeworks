require 'byebug'
class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
    @round_number = 1
  end

  def play
    until game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    puts "Alright! You are now on round #{@round_number}"
    show_sequence
    begin
      # debugger
      require_sequence
      round_success_message
      @sequence_length += 1
    rescue
      game_over_message
    end

  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      system("clear")
      "Here's the sequence, keep your eyes peeled!"
      puts color

      sleep(0.8)
    end
  end

  def require_sequence
    # should repeat sequence
    # if repeats a wrong color, should immediately return game over
    @seq.each do |color|
      user_color = gets.chomp
      if color[0] != user_color
        @game_over = true
        raise "wrong color"
      end
    end
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    "Nice, job!, You completed this round."
  end

  def game_over_message
    "Aww, sorry, that one wasn't correct. Try again sometime!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
    @round_number = 1
  end
end
