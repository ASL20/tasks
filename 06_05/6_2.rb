puts "Введите день недели"
input = STDIN.gets.downcase.strip

case input
when 'monday'
  puts 'Понедельник'
when'tuesday'
  puts 'Вторник'
when 'wednesday'
  puts 'Среда'
when 'thursday'
  puts 'Четверг'
when 'friday'
  puts 'Пятница'
when 'saturday'
  puts 'Суббота'
when 'sunday'
  puts 'Воскресенье'
else
  puts 'Нет такого дня недели'
end
