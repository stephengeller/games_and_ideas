class PickANumber

  GUESS_LIMIT = 10

  def initialize(input = Kernel, limit = GUESS_LIMIT)
    @input = input
    @rand_num = 0
    @limit = limit
    @guesses = 0
  end

  def intro
    puts 'Pick a number between 1 and 10.'
  end

  def reset
    initialize
  end

  def play
    reset
    intro
    randomise
    loop do
      break if correct_guess? || guess_limit_reached
      @guesses += 1
    end
    play_again?
  end

  def correct_guess?
    response = @input.gets.chomp.to_i
    if response == @rand_num
      puts 'You win!'
      true
    else
      puts 'Guess again!'
      false
    end
  end

  def guess_limit_reached
    if @guesses == @limit
      puts 'You lose!'
      true
    end
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

  def randomise
    @rand_num = rand(9) + 1
  end

  # only have 3 guesses
  # keep track of scores
  # swap round the guess game so you guess the computers number and swap sides


  def right_guess
    puts "You're right! The number was #{@rand_num}!"
  end

  def wrong_guess
    puts 'Guess again!'
  end
end

s = PickANumber.new

s.play