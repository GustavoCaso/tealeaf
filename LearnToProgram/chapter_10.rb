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



def custom_shuffle (unsorted, sorted = [], random_numbers = [])
  rand = rand(unsorted.length)
  while random_numbers.length < unsorted.length
    if random_numbers.include? rand
      custom_shuffle(unsorted, sorted, random_numbers)
    else
      sorted << unsorted[rand]
      random_numbers << rand
    end
  end
  return  sorted
end

arr3 = [1,2,3,4,6,5,7,8]

puts custom_shuffle(arr3).inspect




