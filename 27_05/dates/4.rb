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
puts 'Введите дату рождения в формате 12.05.1995'
user_input = STDIN.gets.chomp

condition = true if user_input =~ /^\d{2}.\d{2}.\d{4}$/
end

input_array = user_input.split('.').reverse

(input_array[0].to_i..2021).to_a.each do |year|
  day = Time.new(year, input_array[1], input_array[2]).strftime("%A")
  puts "#{year} - #{days[day]}"
end
