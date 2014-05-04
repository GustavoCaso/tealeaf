#How many hours in a year
puts "hours in a year"
puts 365 * 24

#how many minutes in a decade
puts "minutes in a decade"
puts (60 * 24) * (365 * 10)

#My age in seconds
puts "my age in seconds"
puts ((((60 * 60) * 24) * 365) * 27)

# authors age

def author_age seconds
  seconds_in_year =(((60 * 60) * 24) * 365)
  puts seconds / seconds_in_year
end

puts "The age of the author"
author_age 1160000000