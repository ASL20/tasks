word = "Everybody"
index = 0

while index < word.length
  puts word[index].upcase
  index += 1
end

index = 0

until index == word.length
  puts word[index].upcase
  index += 1
end
