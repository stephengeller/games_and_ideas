#=begin

# randomnumber = rand(10)
#
# puts 'Pick a number between 1 and 10'
#
# answer = gets.chomp
#
# while answer.to_i != randomnumber.to_i
#   puts "Guess again!"
#   answer = gets.chomp
# end


playing = true

while playing == true

  randomnumber = (rand(9))+1
  puts 'Pick a number between 1 and 10.'
  answer = gets.chomp

=begin if answer == "stop"
    puts "Are you sure?"
    finalanswer = gets.chomp
    x = false
    while x = false #finalanswer != "yes"
      if finalanswer == "yes"
        puts "OK...bye!"
        x = true
      elsif finalanswer == "no"
         finishgame = true
         playing = false
        else
      puts "I don't understand, yes or no?"
      finalanswer = gets.chomp
    end
      end
=end




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
   # puts "Great! Pick another number between 1 and 10!"
   # randomnumber = rand(10)
   # answer = gets.chomp
  elsif playagain.downcase == "no"
    puts 'Thanks for playing!'
    break
  end


  end

#=end

# loop do
#   puts 'Pick a number between 1 and 10'
#   input = gets.chomp
#   if input.to_i == randomnumber.to_i
#     puts "You're right the number was #{randomnumber}!"
#     puts "Would you like to play again? Please say yes or no"
#   end
# end

=begin

bottlesofbeer = 99

while bottlesofbeer != 0
puts "#{bottlesofbeer} bottles of beer on the wall, #{bottlesofbeer} bottles of beer!"
bottlesofbeer = bottlesofbeer - 1
puts "You take one down, you pass it around, #{bottlesofbeer} bottles of beer on the wall!"
puts " "
if bottlesofbeer == 2
  puts "#{bottlesofbeer} bottles of beer on the wall, #{bottlesofbeer} bottles of beer!"
  bottlesofbeer = bottlesofbeer - 1
  puts "You take one down, you pass it around, #{bottlesofbeer} bottle of beer on the wall!"
  puts " "
if bottlesofbeer == 1
    puts "#{bottlesofbeer} bottle of beer on the wall, #{bottlesofbeer} bottle of beer!"
    bottlesofbeer = bottlesofbeer - 1
    puts "You take one down, you pass it around, #{bottlesofbeer} bottles of beer on the wall!"
    puts " "
elsif bottlesofbeer == 0
  puts "That's the end of the song!"
end
  end
end


=end