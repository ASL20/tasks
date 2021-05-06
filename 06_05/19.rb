puts "Введите строку, для проверки на палиндромность:"
input = gets.chomp

original_word = input.downcase.chomp

index = 0
count = -1
new_word = ""

while index < original_word.size
  new_word += original_word[count]
  index += 1
  count -= 1
end

if new_word == original_word
  puts('Это палиндром')
else
  puts('Это не палиндром')
end
