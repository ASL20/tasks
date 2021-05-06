puts 'Введите месяц'
input = STDIN.gets.downcase.strip

case input
when 'january'
  puts 1
when 'february'
  puts 2
when 'march'
  puts 3
when 'april'
  puts 4
when 'may'
  puts 5
when 'juny'
  puts 6
when 'july'
  puts 7
when 'august'
  puts 8
when 'september'
  puts 9
when 'october'
  puts 10
when 'november'
  puts 11
when 'december'
  puts 12
else
  puts 'Нет такого месяца'
end
