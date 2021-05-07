def equal(val1, val2)
  return "Строки не равны" unless val1.length == val2.length
  index = 0
  while index < val1.length
    return "Строки не равны" unless val1[index] == val2[index]
    index += 1
  end
  "Строки равны"
end

str1 = "Hello"
str2 = "Hello"

puts equal(str1, str2)
