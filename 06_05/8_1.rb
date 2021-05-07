number = 5
index = 1

while index <= number
  puts "* " * (number - index + 1)
  index += 1
end

index = 1

until index > number
  puts "* " * (number - index + 1)
  index += 1
end

arr = [1, 2, 3, 4, 5]

for num in arr
  puts "* " * arr[-num]
end

arr.each { |num| puts "* " * arr[-num] }
