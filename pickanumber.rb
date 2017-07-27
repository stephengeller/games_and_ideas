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
    sleep(0.1)
    puts "Guess again!"
    randomnumber = (rand(9))+1
    answer = gets.chomp
  end

  if answer.to_i == randomnumber.to_i
    sleep(rand(3))
  puts "You're right! The number was #{randomnumber}!"
  puts "Would you like to play again? Please say 'yes' or 'no'"
  end
  playagain = gets.chomp

  while (playagain.downcase != "yes") && (playagain.downcase != "no")
    puts "I don't understand! Put yes or no!"
    playagain = gets.chomp
  end

  if playagain.downcase == 'yes'
  elsif playagain.downcase == "no"
    puts 'Thanks for playing!'
    break
  end


  end