number = 1

while number <= 10
  puts number
  number += 1
end

number = 1

until number > 10
  puts number
  number += 1
end

for num in 1..10
  puts num
end

(1..10).each { |num| puts num }
