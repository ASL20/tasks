items = %w{ камень ножницы бумага }

user_choice = nil
attempts = 0
user_score = 0
computer_score = 0

user_input = 'y'

while user_input == 'y'
  while attempts < 3
    puts 'Введите вариант: 0 - камень, 1 - ножницы, 2 - бумага'

    user_choice = STDIN.gets.to_i
    computer_choice = rand(3)

    puts "Ваш выбор #{items[user_choice]}"
    puts "Выбор компьютера #{items[computer_choice]}"

    if user_choice == computer_choice
      puts 'Ничья'
      attempts += 1
    elsif user_choice == 0 && computer_choice == 1 ||
        user_choice == 1 && computer_choice == 2 ||
        user_choice == 2 && computer_choice == 0
      puts 'Игрок +1'
      user_score += 1
      attempts += 1
    else
      puts 'Компьютер +1'
      computer_score += 1
      attempts += 1
    end
  end

  if user_score == computer_score
    puts 'Итог: Ничья'
  elsif user_score > computer_score
    puts 'Итог: Победил игрок'
  else
    puts 'Итог: Победил компьютер'
  end

  puts 'Хотите сыграть ещё или завершить игру?(y/n)'
  user_input = STDIN.gets.strip.downcase

  if user_input == 'n'
    break
  elsif user_input == 'y'
    attemtps = 0
  end
end
