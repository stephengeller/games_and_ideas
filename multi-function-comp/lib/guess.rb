class Randomiser

  def initialize
    @name = 'Stephen'
  end

end

class Guesser

  MAX = 1000
  MIN = 1
  GUESS_LIMIT = 10

  attr_reader :guess_num

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
    @guess_num = ((@min_num + rand(num-1)+1).to_i)
    @guess_num = @min_num if @range <= 1
  end

  def intro
    puts "Pick a number between 1 and 1000, and keep it in your head! \n\n"
  end

  def ask
    puts "Is your number #{@guess_num}? You can type HIGHER, LOWER or EQUAL."
  end

  def calculate_range
    @range = @max_num - @min_num
    @range = 0 if @range <= 1
  end

  def correct_guess?
    input = @input.gets.chomp.downcase
    too_high if input == 'lower'
    too_low if input == 'higher'
    if input == ('equal' || 'quit')
      puts 'I win!'
      return true
    end
    false
  end

  def play
    reset
    randomise
    intro
    loop do
      ask
      break if correct_guess? || guess_limit_reached
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

  def add_guess
    p "min num is #{@min_num}"
    p "max num is #{@max_num}"
    p "range is #{@range}"
    p "guess is #{guess_num}"
    @guesses += 1
  end

  def too_low
    @min_num = @guess_num
    range_and_randomise
    add_guess
  end

  def too_high
    @max_num = @guess_num
    range_and_randomise
    add_guess
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



end