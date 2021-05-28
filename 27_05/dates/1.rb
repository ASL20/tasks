require 'date'

user_input = -1

while user_input < 0 || user_input > 2021
  puts 'Введите год своего рождения'
  user_input = STDIN.gets.to_i
end

date =
  if user_input.between?(00, 21)
    "20#{user_input}".to_i
  elsif user_input.between?(22, 99)
    "19#{user_input}".to_i
  else
    user_input
  end

current_date = Date.parse('20210528')

puts "Ваш возраст составляет #{current_date.year - date}"
