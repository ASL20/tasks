number = 5
index = 1

while index <= number
  puts "* " * index
  index += 1
end

index = 1

until index > number
  puts "* " * index
  index += 1
end

arr = (1..5)

for num in arr
  puts "* " * num
end

arr.each { |num| puts "* " * num }
