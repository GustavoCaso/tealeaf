#bottles of beer
i = 99
while i > 1
  puts i.to_s + " Bottles of Beer on the Wall, " + i.to_s + " bottles of beer"
  i -= 1
  puts "Take one down and pass it around," + i.to_s + " bottles of beer on the wall."
  if i == 1
    puts "Take one down and pass it around, no more bottles of beer on the wall."
    puts "Go to the store and buy some more, 99 bottles of beer on the wall."
  end
end

#Deaf Grandma

puts "SAY HELLO TO YOUR GRANDMA !!!!!!!!!"
while true

  talk = gets.chomp
  if talk == "BYE"
    puts "BYE"
    break
  end
  if talk != talk.upcase
    puts "HUH?! SPEAK UP, SONNY!"
  else
    rand_year = rand(1930..1950)
    puts "NO, NOT SINCE " + rand_year.to_s + "!"
  end
end

#Leap years

puts "Tell a starting year ?"
year_1 = gets.chomp.to_i
puts "Tell the end year"
year_2 = gets.chomp.to_i
leap_years = []
while year_1 <= year_2
  if (year_1 % 4 == 0) || (year_1 % 100 == 0 && year_1 % 400 == 0)
    leap_years << year_1
  end
  year_1 += 1
end

puts ""
puts leap_years

