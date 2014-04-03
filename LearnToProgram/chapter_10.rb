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
  return sorted if unsorted.length == 0
  smallest = unsorted[0]
  unsorted.each {|x| smallest = x if x <= smallest}

  unsorted.each {|x| sorted << x if x <= smallest }

  unsorted.delete(smallest)
  custom_sort_3(unsorted, sorted)
end

arr = ["5","6","89","4","3","6","1","2"]
puts custom_sort(arr)




