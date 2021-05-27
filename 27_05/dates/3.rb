puts 'Введите свою дату рождения в формате 12.05.1995'
birthday_input = STDIN.gets.chomp

puts 'Введите любую дату в формате 12.05.1995'
any_date_input = STDIN.gets.chomp

birthday_arr = birthday_input.split('.').reverse
any_date_arr = any_date_input.split('.').reverse

birthday = Time.new(birthday_arr[0], birthday_arr[1], birthday_arr[2])
any_date = Time.new(any_date_arr[0], any_date_arr[1], any_date_arr[2])

age =
  if birthday.month > any_date.month || birthday.day > any_date.day
    any_date.year - birthday.year - 1
  else
    any_date.year - birthday.year
  end

puts "Ваш возраст в эту дату будет составлять #{age}"
