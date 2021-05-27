condition = false
days = {
  'Monday' => 'Понедельник',
  'Tuesday' => 'Вторник',
  'Wednesday' => 'Среда',
  'Thursday' => 'Четверг',
  'Friday' => 'Пятница',
  'Saturday' => 'Суббота',
  'Sunday' => 'Воскресенье'
}

until condition
puts 'Введите дату в формате 00.00.0000'
user_input = STDIN.gets.chomp

condition = true if user_input =~ /^\d{2}\.\d{2}\.\d{4}$/
end

input_array = user_input.split('.').reverse

day = Time.new(input_array[0], input_array[1], input_array[2]).strftime("%A")
puts "Это #{days[day]}"
