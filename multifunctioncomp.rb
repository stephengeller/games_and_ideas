$gameslist = {
    randomnumbergame: 10,
pickanumber: 10,
guess: 8
}

$menucounter = 0

def guess
  puts "\nPick a number between 1 and 1000, and keep it in your head! \n\nPress enter when you're ready!"
  nothing = gets.chomp
  max = 1000
  min = 1
  guess = rand(1000) + 1
  guessing = false
  until guessing
    puts "Is your number #{guess}? You can type HIGHER, LOWER or EQUAL."
    response = gets.chomp
    if response.casecmp("higher").zero?
      min = guess
      guess = (max + min) / 2
      # print ("Higher or lower than " + guess)
    elsif response.casecmp("lower").zero?
      max = guess
      guess = (max + min) / 2
    elsif response.casecmp("equal").zero?
      puts "I won!"
  
      playagain = false
      puts "play again?"
      wronganswercounter = 0
  
      until playagain
        answer = gets.chomp.downcase
  
        if answer == "yes"
          puts "Great!"
          playagain = true
        elsif answer == "no"
          puts "cool man"
          guessing = true
          playagain = true
        elsif wronganswercounter >= 3
          puts "Whatever."
          guessing = true
          playagain = true
        else
          puts "What? Please select yes or no."
          wronganswercounter += 1
        end
      end
    end
  end
end

def div10(n)
  num10 = n / (rand(10) + 1)
  num10
end

def mult10(n)
  num = n * (rand(10) + 1)
  num
end

def randomnumbergame
  stop = false
  playagain = false

  until stop
    puts " WELCOME TO THE RANDOM NUMBER GAME! ".center(50, '*-*')
    puts "Please select a difficulty: Easy, medium or hard."
    difficulty = gets.chomp
    puts "Please type a number between 1 and 100."
    number = gets.chomp.to_i
    sleep(1 / 2)
    puts "Randomising...\n\n"
    sleep(1 / 3)
    # Randomly divides or multiplies a number!
    randnum = [div10(number), mult10(number)].sample
    randnum *= ((rand(10) + 1) * (rand(10) + 1)) if difficulty.downcase.include? == "hard"
    randnum *= (rand(10) + 1) if difficulty.downcase.include? "med"
    puts "Your number is #{randnum}"
    sleep(3 / 4)
    puts "What number affected this? Use 1 decimal place if numbers need decimals"
    affectnum = gets.chomp.to_f
    a1 = (randnum.to_f / number.to_f)
    a2 = (number.to_f / randnum.to_f.round(1))
    ((affectnum.to_f == a1.round(1)) || (affectnum.to_f == a2.round(1))) ? (puts "Correct!") : (puts "Nope! The answer could have been #{a1} or #{a2.round(1)}")
    puts "play again?"
    until playagain
      answer = gets.chomp.downcase
      if answer == "yes"
        puts "Great!"
        playagain = true
      elsif answer == "no"
        puts "Thanks for playing!\n\n".center(50, '*-*')
        stop = true
        playagain = true
        gamemenu
      else
        puts "What? Please select yes or no."
        # answer = gets.chomp.downcase
      end
    end
  end

end

def pickanumber
  playing = true

  while playing

    randomnumber = rand(9) + 1
    puts 'Pick a number between 1 and 10.'
    answer = gets.chomp
    while answer.to_i != randomnumber.to_i
      while answer.to_i > 10
        puts "What did I say? Please choose a number between 1 and 10 you idiot!"
        answer = gets.chomp
      end
      puts "Guess again!"
      randomnumber = rand(9) + 1
      answer = gets.chomp
    end

    if answer.to_i == randomnumber.to_i
      puts "You're right! The number was #{randomnumber}!"
      puts "Would you like to play again? Please say 'yes' or 'no'"
    end
    playagain = gets.chomp

    while !playagain.casecmp("yes").zero? && !playagain.casecmp("no").zero?
      puts "I don't understand! Put yes or no!"
      playagain = gets.chomp
    end

    if playagain.casecmp('yes').zero?
      # puts "Great! Pick another number between 1 and 10!"
      # randomnumber = rand(10)
      # answer = gets.chomp
    elsif playagain.casecmp("no").zero?
      puts 'Thanks for playing!'
      puts " "
      playing == false
      break
    end
end

end

def gamemenu

  puts " GAME MENU ".center(50, '*-*')

  $endgame = true

  puts "What game do you want to play? Type 'mainmenu' to go back!"
  gamestart = gets.chomp
  while $endgame
  # puts "#{$menucounter}"
    if $menucounter > 0
      break
    end
    if gamestart.include? "random" or gamestart.include? "1"
      randomnumbergame
    elsif gamestart.include? "pickanumber" or gamestart.include? "2"
      pickanumber
    elsif gamestart.include? "guess" or gamestart.include? "3"
      guess
    elsif gamestart.downcase.include? "stop" or gamestart.downcase.include?("exit") or gamestart.downcase.include?("quit") or gamestart.downcase.include?("mainmenu")
      break
    elsif gamestart.include? "list"
      $gameslist.each do |game, rating|
        puts "#{game}: #{rating} out of 10"
      end
    else puts "Invalid input! You can type 'random', 'pickanumber', 'guess' or stop."
         gamestart = gets.chomp
    end
  end
end

def mainmenu
  $endgame == false
  choosing = false
  puts " MAIN MENU ".center(50, '*-*')
  puts " "
  # puts "What would you like to do? You can see what games there are, \nplay those games, and even recommend new ones to the developers! \nYou can also update ratings of games that already exist."

  until choosing
    puts "What would you like to do? You can see what games there are,".center(50)
    puts "play those games, and even recommend new ones to the developers!".center(50)
    puts "You can also update ratings of games that already exist.".center(50)
    choice = gets.chomp.downcase
    if choice.include? "play"
      puts " "
      if $menucounter != 0
        $menucounter -= 1
      end
      gamemenu
    elsif choice.include? "list"
      $gameslist.each do |game, rating|
        puts " #{game} ".center(20, "*") + ": #{rating} out of 10"
      end
    elsif choice.include? "add"
      puts "What game do you want to add?"
      title = gets.chomp
      add_game(title)
    elsif choice.include? "delete"
      delete_game
    elsif choice.include? "quit"
      puts "Thanks for playing!"
      choosing
      break
    elsif choice.include? "help"
      puts "You can either type 'play', 'add', 'list' or 'delete'."
      puts "You can also type 'quit' to quit the game!"
    else puts "Invalid input. Type 'help' if you don't know what to type!\n\n"
    end
  end
end

def add_game(title)
  if $gameslist[title.to_sym].nil? && !title.downcase.include?("call of duty")
    puts "What's the rating? (Type a number between 0 and 10)"
    rating = gets.chomp
    puts "Wow, #{rating}? This must be a good game! \n\n" if rating.to_i > 7
    $gameslist[title.to_sym] = rating.to_sym
    puts "#{title} has been added with a rating of #{rating}!"
    puts ""
  elsif title.downcase.include? "call of duty"
    puts "OH HELL NAW"
    puts ""
  else puts "That game is already there!"
  end
end

def delete_game
  deleting = true
  while deleting
    puts "What game would you like to delete?"
    $gameslist.each { |game, _rating| puts "#{game}" }
    title = gets.chomp.to_s.to_sym
    break if (title == "exit") || (title == "quit")
    puts "That game does not exist! \n " if $gameslist[title].nil?
    $gameslist.each { |game, rating| puts "Wow. With a rating of #{rating}, that one will be missed!" if rating.to_i > 7 && game == title }
    # end
    $gameslist.delete(title)
    puts "The game '#{title}' has been deleted from the database."
    break
  end
end

mainmenu
