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
