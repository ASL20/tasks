numbers = [-5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, -1, -2]

numbers.each do |num|
  if num > 0
    puts "#{num} - this number is positive"
  elsif num < 0
    puts "#{num} - this number is negative"
  elsif num == 0
    puts "#{num} - this number is zero"
  end
end

index = 0

while index < numbers.length
  if numbers[index] > 0
    puts "#{numbers[index]} - this number is positive"
  elsif numbers[index] < 0
    puts "#{numbers[index]} - this number is negative"
  elsif numbers[index] == 0
    puts "#{numbers[index]} - this number is zero"
  end
  index += 1
end
