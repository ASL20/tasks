puts 'Введите пароль'
user_input = STDIN.gets.chomp

if user_input.length >= 10 &&
  user_input.count("\\А-ЯA-Z") >= 2 &&
  user_input.count("\\0-9") >= 2 &&
  user_input.count("\\%&@#") >= 2 &&
  user_input.match?(/[A-Za-zА-Яа-я]/)
  puts 'Пароль надежный'
else
  puts 'Пароль недостаточно надежный'
end
