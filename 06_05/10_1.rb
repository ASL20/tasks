puts 'Введите месяц'
input = STDIN.gets.downcase.strip

if input == 'january'
  puts 1
elsif input == 'february'
  puts 2
elsif input == 'march'
  puts 3
elsif input == 'april'
  puts 4
elsif input == 'may'
  puts 5
elsif input == 'juny'
  puts 6
elsif input == 'july'
  puts 7
elsif input == 'august'
  puts 8
elsif input == 'september'
  puts 9
elsif input == 'october'
  puts 10
elsif input == 'november'
  puts 11
elsif input == 'december'
  puts 12
else
  puts 'Нет такого месяца'
end
