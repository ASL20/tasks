word = "EverYbodY"
index = 0

while index < word.length
  puts word[index].downcase
  index += 1
end

index = 0

until index == word.length
  puts word[index].downcase
  index += 1
end

split_word = word.split('')

for letter in split_word
  puts letter.downcase
end

split_word.each { |letter| puts letter.downcase}
