puts 'Введите слово'
input = STDIN.gets.chomp

index = 0
count = -1
new_word = ""

while index < input.size
  new_word += input[count]
  index += 1
  count -= 1
end

puts new_word

index = 0
count = -1
new_word = ""

until index >= input.size
  new_word += input[count]
  index += 1
  count -= 1
end

puts new_word
