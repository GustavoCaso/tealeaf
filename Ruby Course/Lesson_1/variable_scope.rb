#1 Create a local variable and modify it at an inner scope (in between a do/end block). You can try
  #a) re-assigning the variable to something else
  #b) call a method that doesn’t mutate the caller
  #c) call a method that mutates the caller.
#2 Create a local variable at an inner scope (within a do/end block) and try to reference it in the outer scope. What happens when you have nested do/end blocks?

local_variable = "Hello I'm a local variable"
local_variable_2 = "HELLO I'M A LOCAL VARIABLE"


def not_change_method str
  # this method doesn't mutate the str variable
  str.upcase
end

# a) re-assigning
local_variable_reassign = not_change_method local_variable
puts local_variable_reassign

def change_method str
  #c) this method does mutate the str variable
  str.downcase!
end

change_method local_variable_2

puts local_variable_2

#2

def create_local_inner_variable str
  str2 = str
end

local_variable_3 = "what I'm doing here"

create_local_inner_variable local_variable_3
#this variable it's not with in this scope so there, we can create outside of the method the str2 variable and insticiate it
# other option when it return the variable re-assign it to another variable
begin
  str2
rescue NameError
  puts "str2 does not exits here"
end




