number = 1
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

while number <= 10
  puts number
  number += 1
end

number = 1

until number > 10
  puts number
  number += 1
end

for num in arr
  puts num
end

arr.each { |num| puts num }
