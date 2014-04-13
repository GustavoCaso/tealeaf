require 'pry'
require 'date'

# Happy Birthday

def guess_how_old(year,month,day)
  birthday = Time.new(year,month,day)
  age = 0
  actual_year, actual_month, actual_day = Time.now.strftime("%Y-%-m-%d").split("-")
  birth_year, birth_month, birth_day = birthday.strftime("%Y-%-m-%d").split("-")
  age = actual_year.to_i - birth_year.to_i
  if actual_month.to_i - birth_month.to_i < 1
    age -= 1
  elsif actual_month == birth_month && (actual_day == birth_day || actual_day - birth_day > 1)
    age += 1
  end
  "Your age is #{age}"
end


puts guess_how_old(1986,9,29)


# Roman to numbers

def roman_to_integers(roman_number)
  values = {i: 1, v: 5, x: 10, l: 50, c: 100, d: 500, m: 1000}
  keys = values.keys

  result = 0

  valid_letters = values.map{|k,v| k.to_s}

  roman_letters_input = roman_number.split('')

  invalid_letters = roman_letters_input - valid_letters

  prev = 0

  if invalid_letters.empty?

    roman_letters_input.reverse.each do |letter|
      val = values[letter.to_sym]
      if val < prev
        val *= -1
      else
        prev = val
      end
      result += val
    end

  else
    puts "The roman number you enter its ivalid"
    exit
  end

  result

end

puts roman_to_integers('mcmxcix')


# Birthday Helper

def birth_date_helper(output_name)
  file = File.new('LearnToProgram/list.txt')
  birth_date = {}
  file.each_line do |line|
    name , date , year = line.split(',')
    birth_date[name] = date + year.chomp
  end

  if birth_date[output_name]
    puts "This is you Birthday #{birth_date[output_name]}"
    d = Date.parse(birth_date[output_name])
    actual_year, actual_month, actual_day = Time.now.strftime("%Y-%-m-%d").split("-")
    birthday = Date.parse("#{actual_year}-#{d.month}-#{d.day}")
    if birthday < Date.parse("#{actual_year}-#{actual_month}-#{actual_day}")
      puts "Happay birthday a little late, but you what they say, is never late"
      puts "You're last bitrhday was #{birthday}"
      age = guess_how_old(d.year,d.month,d.day)
      puts "And know you are #{age}"
      puts "Your next birthday will be #{birthday + 365}"
    else
      puts "Your next birthday will be #{birthday}"
    end

  else
    puts "Soory your name in not on the list"
  end

end

birth_date_helper("The King of Spain")

