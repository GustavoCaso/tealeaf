#sort words
#we have two arrays the first one is the one givebn by the user and the other is the one that hold the sorted words
#every time we find a word is smallest we place it in the sorted array and deleted from the unshorted array
# problem:
  # 1. how to find the smallest word of all
  # 2. compare each element of the array with the smallest
  #     if it is smallest push it in shorted array
  # 3. after we founf it delete from the unshorted array
  # 4. call custom_sort again passing the new arrays


def custom_sort (unsorted, sorted = [])
  return sorted.uniq if unsorted.length == 0
  smallest = unsorted[0]
  unsorted.each {|x| smallest = x if x <= smallest}

  unsorted.each {|x| sorted << x if x <= smallest }

  unsorted.delete(smallest)
  custom_sort(unsorted, sorted)
end

arr = ["hello","bye","hate","ruby","tealeaf","achieve","skate","pain"]
puts custom_sort(arr).inspect

def dictionary_sort (unsorted, sorted = [])
  return sorted.uniq if unsorted.length == 0
  smallest = unsorted[0]
  unsorted.each do |x|
    smallest = x if x.downcase <= smallest.downcase
  end
  unsorted.each {|x| sorted << x if x.downcase <= smallest.downcase }
  unsorted.delete(smallest)
  dictionary_sort(unsorted, sorted)
end

arr2 = ["hello","bye","hate","ruby","Achieve","skate","pain","Tealeaf"]
puts dictionary_sort(arr2).inspect

def custom_shuffle (unsorted, sorted = [])
  return sorted if unsorted.length == 0
  random_numbers = []
  unsorted.each do |value|
    rand = rand(unsorted.length + 1)
    if random_numbers.include? rand
      custom_shuffle(unsorted, sorted)
    else
      sorted[rand] = value
    end
    unsorted.delete(value)
  end
  custom_shuffle(unsorted, sorted)
  random_numbers << rand
end

arr3 = [1,2,3,4,5,6,7,8]

puts custom_shuffle(arr3).inspect

