array = (1..10).to_a
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

split_word = word.split('')

for element in split_word
  puts "#{element} -> #{split_word.index(element)}"
end

split_word.each { |num| puts "#{num} -> #{split_word.index(num)}"}
