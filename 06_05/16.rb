(1..100).each do |num|
  if num % 3 == 0
    puts 'Fizz'
  elsif num % 5 == 0
    puts 'Buzz'
  elsif num % 14 == 0
    puts 'FizzBuzz'
  else
    puts num
  end
end
