puts "Введите день недели"
input = STDIN.gets.downcase.strip

if input == 'monday'
  puts 'Понедельник'
elsif input == 'tuesday'
  puts 'Вторник'
elsif input == 'wednesday'
  puts 'Среда'
elsif input == 'thursday'
  puts 'Четверг'
elsif input == 'friday'
  puts 'Пятница'
elsif input == 'saturday'
  puts 'Суббота'
elsif input == 'sunday'
  puts 'Воскресенье'
else
  puts 'Нет такого дня недели'
end
