require 'yaml'


# the method to_yaml convert the object in a yaml object to be save in a file
array_to_yaml = ["how you plan on doing", "this convertion",["multidimensional array", 42, ["another array"]],["empty array"], "to save on a file"].to_yaml

file_name = "array_to_yaml.yml"

# File.open opens the file and write it and then close it
File.open file_name, "w+" do |f|
  f.write array_to_yaml
end
# Read the file
output = File.read file_name

# Convert the yaml file into readable
read_yaml = YAML::load output

puts read_yaml


file_name_2 = "new_file.txt"

File.open file_name_2, "w+" do |f|
  f.write("Writing from the File open method")
  f.write("\n")
  f.write("This is really fun")
  f.write("\n")
  f.write("I created an array from a file")
end

output = File.read file_name_2

puts output.split("\n").inspect


# Rename Picture
Dir.chdir  "../../Desktop/Images"
pictures = Dir['*.{jpg,jpeg}']

pictures.each do |picture|
  puts "The #{picture} is inside the folder what do you want to do: 1) rename, 2) delete, 3) nothing"
  answer = gets.chomp.to_i
  if answer == 1
    puts "So you want to rename it. Good what you want to rename it"
    answer = gets.chomp
    File.rename(picture, File.join(Dir.pwd, answer))
    puts "The picture now it is #{answer}"
  elsif answer == 2
    puts "You want to delete it"
    File.delete(picture)
    unless File.exists?(picture)
      puts "The file has been delete it"
    end
  else
    puts "so you want to do nothing to the file"
    puts "Done !!!!"
  end
end

puts "Thanks for handeling our images"





