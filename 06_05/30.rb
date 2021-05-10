number = rand(100) + 1
attempts = 0
puts number
while attempts < 3
  puts 'Введите число от 1 до 100'
  input = STDIN.gets.to_i

  attempts += 1
  if input > number
    puts 'Нужно меньше'
  elsif input < number
    puts 'Нужно больше'
  else
    break
  end
end

if attempts == 3
  puts "Вы проиграли. Это было число: #{number}"
elsif
  puts "Вы выиграли\nПотрачено попыток: #{attempts}"
end
