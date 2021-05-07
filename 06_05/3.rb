array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
index = 0

while index < array.size
  puts "#{array[index]} -> #{index}"
  index += 1
end

index = 0

until index == array.size
  puts "#{array[index]} -> #{index}"
  index += 1
end

for element in array
  puts "#{element} -> #{array.index(element)}"
end

array.each { |num| puts "#{num} -> #{array.index(num)}"}

word = "Amalgamma"

index = 0

while index < word.size
  puts "#{word[index]} -> #{index}"
  index += 1
end

index = 0

until index == word.size
  puts "#{word[index]} -> #{index}"
  index += 1
end

