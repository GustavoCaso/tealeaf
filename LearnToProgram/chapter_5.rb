#Full name
puts "What's your first name"
first_name = gets.chomp
puts "What's your second name"
second_name = gets.chomp
puts "What's you last name"
last_name = gets.chomp

puts "Hello nice to meet you " + first_name + " " + second_name + " " + last_name
total_length = first_name.length + second_name.length + last_name.length
puts "Did you know your name has " + total_length.to_s + " ?"

#Favorite Number

puts "What's your favorite number"
number = gets.chomp
number = number.to_i + 1
puts "I think this number will be higher " + number.to_s