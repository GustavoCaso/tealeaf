#building and sorting Array
puts "Type as many words as you want separated by a space. Remember at any moment you hip enter it will stop and print all your words in alphabetical order "
words = gets.chomp
words_array = words.split(" ").sort
words_array.each_with_index do |v,i|
  puts "#{i}: #{v}"
end

#Table of contents revisited
contents = ["Table of Contents", "Chapter 1: Getting Satrted", "page 1", "Chapter 2: Numbers", "page 9", "Chapter 3: Letters", "page 13"]
contents.each_with_index do |content, index|
  if index == 0
    puts content.center(50)
    puts
  end

  if index != 0 && index % 2 == 1
    puts content.ljust(30) + contents[index+1].rjust(20)
  end
end

