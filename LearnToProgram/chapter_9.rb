#Roman numbers

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