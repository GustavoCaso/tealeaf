def not_mutate arr
  arr.map {|x| x.to_s + "!?!?!?!?!?!?!!?"}
end

def mutate arr
  arr.delete(arr.first)
end


arr1 = [1,2,3,4,5,6,6,7]

not_mutate arr1
# this is going to be the same
puts arr1.inspect
# but this one after reassign the value it will be completly different from arr1
arr1_5 = not_mutate arr1

puts arr1_5.inspect

arr2 = ["heello", "hola", "adios", "bye"]
# this array is completly different because the delete method mutate the array
mutate arr2

puts arr2.inspect