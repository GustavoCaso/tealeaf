#Roman numbers first version Brandon help crack the code

def roman_numbers num
  result = []
  m = num / 1000
  result << "M" * m if m != 0
  d = num % 1000 / 500
  result << "D" * d
  c = num % 500 / 100
  result << "C" * c
  l = num % 100 / 50
  result << "L" * l
  x = num % 50 / 10
  result << "X" * x
  v = num % 10 / 5
  result << "V" * v
  i = num % 5 / 1
  result << "I" * i
  return result.join('')
end



puts roman_numbers 49

#second version I decided to refactor it
def roman_numbers_3 num
  info = [["M", 1000],["D", 500],["C", 100],["L", 50],["X",10],["V", 5],["I", 1]]
  result = []
  result << "M" * (num / 1000)
  info.each_with_index do |arr, i|
    if i+1 <= 6
      number = num % info[i][1] / info[i+1][1]
      result << info[i+1][0] * number
    end
  end
  return result.join('')
end




puts roman_numbers_3 46780