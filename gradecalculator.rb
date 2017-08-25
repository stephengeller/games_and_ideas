$secondyear = [
    ["PSY259", 64, 20],
    ["PSY243", 75, 10],
    ["PSY219", 60, 20],
    ["PSY245", 72, 10],
    ["PSY239", 68, 20],
    ["PSY246", 61, 20],
    ["JNL210", 55, 20]
]

$thirdyear = [
    ["PSY331", 72, 20],
    ["COGDEV", 72, 10],
    ["FORENSIC", 64, 10],
    ["IND DIV S1", 59, 10],
    ["DISSERTATION", 78, 40],
    ["LEARN & MEM", 72, 10],
]

$o3yg = 0
$o2yg = 0

def whatneeded(currentgrade, creditssofar, whatgradedoyouwant)
  if creditssofar == 120
    puts "Sorry! You can't change this grade as you don't have any credits left!"
  else
    requiredgrade = ((((whatgradedoyouwant.to_f * 120) - (currentgrade.to_f * creditssofar.to_f)).to_f / (120 - creditssofar.to_f))).to_f
    requiredgrade = requiredgrade.to_f
   # requiredgrade = 40 if requiredgrade < 40
    if requiredgrade > 100
      puts "Sorry...this is impossible :("
    elsif requiredgrade < 40
      puts "In order to get 60% overall, all you'll need to do is pass!"
    else
      puts "In order to get #{whatgradedoyouwant}% overall, you will need to average #{requiredgrade.round(1)}% in your remaining #{120 - creditssofar} credits."
    end
    end
  end

def inputgrade
  adding = true
  while adding
    puts "What year did you get this grade in? Type 2 for second year, 3 for third year."
    year = gets.chomp
    puts "What module would you like to add the grade of?"
    gradename = gets.chomp
    puts "What grade did you get in that module?"
    grademark = gets.chomp
    puts grademark.to_i
    if grademark.to_i == "0"
      puts "Invalid input!"
      grademark = gets.chomp
    end
    $secondyear[gradename.to_s] = grademark.to_i if year == "2"
    $thirdyear[gradename.to_s] = grademark.to_i if year == "3"
    puts "Recorded: You received #{grademark} in #{gradename} in year #{year}.\n"
    puts "Would you like to add another grade?"
    answer1 = gets.chomp
    break if answer1.casecmp("no").zero?
  end
  listgrades($secondyear) && "\n\n" && listgrades($thirdyear)
  puts "Would you like to see what your grades are added up?"
  answer = gets.chomp
  if answer.casecmp("yes").zero?
    puts "Which year? 2, 3 or both?"
    yearchoice = gets.chomp
    gradessum($secondyear) if yearchoice == "2"
    gradessum($thirdyear) if yearchoice == "3"
    if yearchoice.casecmp("both").zero?
      gradessum($thirdyear)
      puts "\n"
      gradessum($secondyear)
    end
  end
end

def listgrades(year)
  puts "\nThese are your current grades for 2nd year:" if year == $secondyear
  puts "\nThese are your current grades for 3rd year:" if year == $thirdyear
  year.each do |name, grade|
    puts "#{name}: #{grade} \n"
  end
end

def gradessum(year)
  n = 0
  totalgrades = year.inject(0) { |a, (_, b)| a + b }
  year.each do |_x, _y|
    n = n += 1
  end
  totalgrades = totalgrades.to_f
  score = totalgrades / n
  puts "Your average grade so far in 2nd year is #{score}%" if year == $secondyear
  puts "Your average grade so far in 3rd year is #{score}%" if year == $thirdyear
end

def describe_year(year)
  allgrades = 0
  allcredits = 0
  numberofgrades = 0
  averagegrade = 0
  nummodules = 0
  year.each do |_name, grade, credits|
    allgrades += grade.to_f
    allcredits += credits
    nummodules += 1
    numberofgrades += (grade.to_f * (credits / 10)) / 10
    averagegrade = ((numberofgrades.to_f / allcredits) * 100).round(1)
    if year == $secondyear
      $secondyeargrade = averagegrade
    else
      $thirdyeargrade = averagegrade
    end
  end
  year == $secondyear ? (puts "Statistics for 2nd year:\n") : (puts "Statistics for 3rd year:\n")
  puts "\nYour average grade for this year is #{averagegrade}% over #{nummodules} modules."
  puts "\nYou've completed " + allcredits.to_s + " credits so far, and so you have #{120 - allcredits.to_i} remaining credits for the rest of the year.\n\n"

  whatneeded(averagegrade, allcredits, 70)
  whatneeded(averagegrade, allcredits, 60)

end

def addtoyear(year)
  puts "\nAdd your course name, grade and number of credits!\n"
  thing1 = "PSY123"
  thing2 = 80
  thing3 = 20
  year << [thing1, thing2, thing3]
  puts "\nYou got #{thing2.to_s + " marks in " + thing1 + ", which was worth " + thing3.to_s + " credits"}!"
  print "\n" + "#{year}" + "\n\n"
end

describe_year($thirdyear)
describe_year($secondyear)
puts "\n\n"
puts $secondyeargrade
puts "Your grade for this year is #{$thirdyeargrade}%"
$overallgrade = ($secondyeargrade.to_f + ($thirdyeargrade.to_f * 2)).to_f / 3
puts "\n\n"
puts "Your OVERALL grade combined is #{$overallgrade}"