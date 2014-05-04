#1. Use the "each" method of Array to iterate over [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], and print out each value.

#2. Same as above, but only print out values greater than 5.

#3. Now, using the same array from #2, use the "select" method to extract all odd numbers into a new array.

#4. Append "11" to the end of the array. Prepend "0" to the beginning.

#5. Get rid of "11". And append a "3".

#6. Get rid of duplicates without specifically removing any one value.

#7. What's the major difference between an Array and a Hash?

#8. Create a Hash using both Ruby 1.8 and 1.9 syntax.

#Suppose you have a h = {a:1, b:2, c:3, d:4}

#9. Get the value of key "b".

#10. Add to this hash the key:value pair {e:5}

#13. Remove all key:value pairs whose value is less than 3.5

#14. Can hash values be arrays? Can you have an array of hashes? (give examples)

#15. Look at several Rails/Ruby online API sources and say which one your like best and why.

#1

arr = [1,2,3,4,5,6,7,8,9,10,11]
arr.each {|x| puts x}

#2

arr.each {|x| puts x if x > 5}

#3
odd = arr.select {|x| x.odd? }

#4

arr.push(11)

#5

arr.delete(11)
arr.push(3)

#6
arr.uniq!

#7
#Array is a collection of data and hash is collection of key value pairs

#8
hash = {:a => 1, :b => 2, :c => 3}
hash2 = {a:1, b:2,c:3}

#9

hash2[:b]

#10

hash[:e] = 5

#13
hash2.delete_if{|key,value| hash2[key] < 3.5}

#14
hash3 = {a: [1,2,34,5]}
hash4 = [{a:6,b:8,c:10}, 2,3]
