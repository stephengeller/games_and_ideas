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
  guess = rand(1000)+1
  guessing = false
  while not guessing
  puts "Is your number #{guess}? You can type HIGHER, LOWER or EQUAL."
  response = gets.chomp
    if response.downcase == "higher"
      min = guess
      guess = (max + min) / 2
      #print ("Higher or lower than " + guess)
    elsif response.downcase == "lower"
      max = guess
      guess = (max + min) / 2
    elsif response.downcase == "equal"
      puts "I won!"

      playagain = false
      puts "play again?"
      wronganswercounter = 0git

      while not playagain
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

def randomnumbergame

  def div10(n)
    # Number gets divided by a random number between 1 and 10
    num10 = n/(rand(10)+1)
    num10
  end

  def mult10(n)
    # Number gets multiplied by a random number between 1 and 10
    num = n*(rand(10)+1)
    num
  end

  stop = false

  while (not stop)
    puts "Please select a difficulty: Easy, medium or hard."
    difficulty = gets.chomp
    puts "Please type a number between 1 and 10."

    number = gets.chomp.to_i
    sleep(3/4)
    puts "Randomising..."
    sleep(4/3)
    # Randomly divides or multiplies a number!
    randnum = [div10(number), mult10(number)].sample
    if difficulty.downcase == "hard"
      randnum = randnum*((rand(10)+1)*(rand(10)+1))
    elsif difficulty.downcase == "medium"
      randnum = randnum*(rand(10)+1)
      elsif difficulty.downcase == "easy"
      else
    end
    puts "Your number is " + "#{randnum}"
    sleep(3/4)
    puts "What number affected this?"
    affectnum = gets.chomp
    affectnum = affectnum.to_i
    a1 = (randnum.to_f / number.to_f)
    #puts a1
    a2 = (number.to_f / randnum.to_f)
   # puts a2
    if (affectnum == a1.round(2)) or (affectnum == a2.round(2))
      puts "Correct!"
      else puts "Nope! The answer could have been #{a1} or #{a2}"
    end

    playagain = false
    puts "play again?"
    wronganswercounter = 0

  while not playagain
    answer = gets.chomp.downcase

    if answer == "yes"
      puts "Great!"
      playagain = true
    elsif answer == "no"
      puts "cool man"
      stop = true
      playagain = true
    elsif wronganswercounter >= 3
        puts "Whatever."
        stop = true
        playagain = true
    else
      puts "What? Please select yes or no."
      wronganswercounter += 1
      end
    end
  end

end

def pickanumber
  playing = true

  while playing == true

    randomnumber = (rand(9))+1
    puts 'Pick a number between 1 and 10.'
    answer = gets.chomp
  while answer.to_i != randomnumber.to_i
    while answer.to_i > 10
      puts "What did I say? Please choose a number between 1 and 10 you idiot!"
      answer = gets.chomp
    end
    puts "Guess again!"
    randomnumber = (rand(9))+1
    answer = gets.chomp
  end

  if answer.to_i == randomnumber.to_i
    puts "You're right! The number was #{randomnumber}!"
    puts "Would you like to play again? Please say 'yes' or 'no'"
  end
  playagain = gets.chomp

  while (playagain.downcase != "yes") && (playagain.downcase != "no")
    puts "I don't understand! Put yes or no!"
    playagain = gets.chomp
  end

  if playagain.downcase == 'yes'
    # puts "Great! Pick another number between 1 and 10!"
    # randomnumber = rand(10)
    # answer = gets.chomp
  elsif playagain.downcase == "no"
    puts 'Thanks for playing!'
    puts " "
  playing == false
    break
  end
end

end

def gamemenu

$endgame = true

while $endgame == true
#puts "#{$menucounter}"
  if $menucounter > 0
    break
  end

  puts "what game do you want to play? Type \"mainmenu\" to go back!"
  gamestart = gets.chomp
  if gamestart.include? "random" or gamestart.include? "1"
    randomnumbergame
  elsif gamestart.include? "pickanumber" or gamestart.include? "2"
    pickanumber
  elsif gamestart.include? "guess" or gamestart.include? "3"
    guess
  elsif gamestart.downcase.include? ("stop") or gamestart.downcase.include?("exit") or gamestart.downcase.include?("quit") or gamestart.downcase.include?("mainmenu")
    $menucounter += 1
    puts "#{$menucounter}"
    mainmenu
    #puts "See ya!"
    #endgame == true
    #break
  elsif gamestart.include? "list"
    $gameslist.each do |game, rating|
      puts "#{game}: #{rating} out of 10"
    end
  else puts "Invalid input!"
  end
end
end

def mainmenu
  $endgame == false
  choosing = false
  puts "***MAIN MENU***"
  puts " "
  puts "What would you like to do? You can see what games there are, \nplay those games, and even recommend new ones to the developers! \nYou can also update ratings of games that already exist."
  while not choosing

choice = gets.chomp
choice == choice.downcase

  if choice.include? "play"
      puts "***GAME MENU***"
      puts " "
      if $menucounter != 0
      $menucounter -= 1
      end
      #puts "#{$menucounter} (in mainmenu)"
      gamemenu


  elsif choice.include? "list"
        $gameslist.each do |game, rating|
        puts "#{game}: #{rating} out of 10"
        end


  elsif choice.include? "add"
      puts "What game do you want to add?"
      title = gets.chomp
      if $gameslist[title.to_sym].nil? && !title.downcase.include?("call of duty")
        puts "What's the rating? (Type a number between 0 and 10)"
        rating = gets.chomp
        if rating.to_i > 7
          puts "Wow, #{rating}? This must be a good game!"
          puts ""
        end
        $gameslist[title.to_sym] = rating.to_sym
        puts "#{title} has been added with a rating of #{rating}!"
        puts ""
      elsif title.downcase.include? "call of duty"
        puts "OH HELL NAW"
        puts ""
      else puts "That game is already there!"
      end

  elsif choice.include? "delete"
      deleting = true
      while deleting == true
      puts "What game would you like to delete?"
      #$gameslist.each do |game, rating|
      #  puts "#{game}"
      #end
      title = gets.chomp
      if title == "exit" or title == "quit"
        deleting == false
        break
      elsif $gameslist[title].nil?
          puts "That game does not exist! \n "
        else
          $gameslist.each do |game, rating|
            if rating.to_i > 7
            puts "Wow. With a rating of #{rating}, that one will be missed!"
            end
          end
          $gameslist.delete(title)
          puts "#{title} has been deleted."
          deleting == false
          break
        end
      end


  elsif choice.include? "quit"
        puts "Thanks for playing!"
      choosing == true
      break
  elsif choice.include? "help"
    puts "You can either type \"play\", \"add\", \"list\" or \"delete\". You can also type \"quit\" to quit the game!"

  else puts "Invalid input. Type \"help\" if you don't know what to type!"
      puts ""
  end
end
end

mainmenu