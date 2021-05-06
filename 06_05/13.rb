puts 'Введите число'
number = STDIN.gets.to_i

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

arr = (1..number)

for num in arr
  puts "* " * num
end

arr.each { |num| puts "* " * num }
