puts 'Введите дату своего рождения'
user_input = STDIN.gets.to_i

if user_input.between?(00, 21)
  date = "20#{user_input}".to_i
elsif user_input.between?(22, 99)
  date = "19#{user_input}".to_i
else
  date = user_input
end

current_date = Time.now.year

puts "Ваш возраст составляет #{current_date - date}"
