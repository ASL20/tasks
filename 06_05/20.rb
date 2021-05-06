numbers = (-10..10)

numbers.each do |num|
  if num > 0
    puts "#{num} - this number is positive"
  elsif num < 0
    puts "#{num} - this number is negative"
  elsif num == 0
    puts "#{num} - this number is zero"
  end
end
