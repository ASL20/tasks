items = %w{ камень ножницы бумага }

puts 'Введите вариант: 0 - камень, 1 - ножницы, 2 - бумага'
user_choice = STDIN.gets.to_i

computer_choice = rand(3)

puts "Ваш выбор #{items[user_choice]}"
puts "Выбор компьютера #{items[computer_choice]}"

if user_choice == computer_choice
  puts 'Ничья'
elsif user_choice == 0 && computer_choice == 1 ||
    user_choice == 1 && computer_choice == 2 ||
    user_choice == 2 && computer_choice == 0
  puts 'Победил игрок'
else
  puts 'Победил компьютер'
end
