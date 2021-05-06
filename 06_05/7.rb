range = (1..9).to_a
index = 0

while index < range.size
  puts "#{range[index]} x 3 = #{range[index] * 3}"
  index += 1
end

index = 0

until index == range.size
  puts "#{range[index]} x 3 = #{range[index] * 3}"
  index += 1
end

for num in range
  puts "#{num} x 3 = #{num * 3}"
end

range.each { |num| puts "#{num} x 3 = #{num * 3}" }
