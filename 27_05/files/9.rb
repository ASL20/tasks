str = ""
arr = [('A'..'Z').to_a, ('0'..'9').to_a, ('a'..'z').to_a, ('А'..'Я').to_a, ('а'..'я').to_a, %w[% & @ #]]

while str.size < 20
  str << arr.sample.sample
end

puts str

if str.length >= 10 &&
  str.count("\\А-ЯA-Z") >= 2 &&
  str.count("\\0-9") >= 2 &&
  str.count("\\%&@#") >= 2 &&
  str.match?(/[A-Za-zА-Яа-я]/)
  puts 'Пароль надежный'
else
  puts 'Пароль недостаточно надежный'
end
