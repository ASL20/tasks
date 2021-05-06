puts 'Введите год'
year = STDIN.gets.to_i

if year % 4 == 0 || year % 400 == 0
  puts "#{year} год високосный"
else
  puts "#{year} год не високосный"
end
