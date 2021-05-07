array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
index = 0

while index < array.size
  puts "#{array[index]} x 3 = #{array[index] * 3}"
  index += 1
end

index = 0

until index == array.size
  puts "#{array[index]} x 3 = #{array[index] * 3}"
  index += 1
end

for num in array
  puts "#{num} x 3 = #{num * 3}"
end

array.each { |num| puts "#{num} x 3 = #{num * 3}" }
