class Randomiser

  def initialize
    @name = 'Stephen'
  end

end

class Guesser

  MAX = 1000
  MIN = 1
  GUESS_LIMIT = 10

  def initialize(input = Kernel)
    @input = input
    @max_num = MAX
    @min_num = MIN
    @guesses = 0
    calculate_range
  end

  def reset
    initialize
  end

  def randomise(num = @range)
    @guess_num = (@min_num + rand(num).to_i)
  end

  def intro
    puts "Pick a number between 1 and 1000, and keep it in your head! \n\n"
  end

  def ask
    puts "Is your number #{@guess_num}? You can type HIGHER, LOWER or EQUAL."
  end

  def calculate_range
    @range = @max_num - @min_num
  end

  def play
    reset
    randomise
    intro
    loop do
      ask
      break if correct_guess? || guess_limit_reached
      @guesses += 1
    end
    play_again?
  end

  def guess_limit_reached
    if @guesses == GUESS_LIMIT
      puts 'I lose!'
      return true
    end
    false
  end

  def range_and_randomise
    calculate_range
    randomise
  end

  def too_low
    @min_num = @guess_num
    range_and_randomise
  end

  def too_high
    @max_num = @guess_num
    range_and_randomise
  end


  def play_again?
    puts 'Play again?'
   loop do
     response = @input.gets.chomp.downcase
     return play if response == 'yes'
     break       if response == 'no'
     puts 'Invalid input, yes or no?'
   end
    puts 'Thanks for playing!'
  end

  def correct_guess?
    input = @input.gets.chomp.downcase
    too_high if input == 'lower'
    too_low if input == 'higher'
    if input == 'equal'
      puts 'I win!'
      return true
    end
    false
  end

end

s = Guesser.new
s.play