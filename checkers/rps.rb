def rps
  items = %w{ камень ножницы бумага }

  player_choice = nil
  result = [nil, nil]
  player_score = 0
  enemy_score = 0

  user_input = 'y'

  while user_input == 'y'
    puts 'Введите вариант: 0 - камень, 1 - ножницы, 2 - бумага'

    player_choice = STDIN.gets.to_i
    enemy_choice = rand(3)

    puts "Ваш выбор #{items[player_choice]}"
    puts "Выбор противника #{items[enemy_choice]}"

    if player_choice == enemy_choice
      puts 'Ничья'
    elsif player_choice == 0 && enemy_choice == 1 ||
        player_choice == 1 && enemy_choice == 2 ||
        player_choice == 2 && enemy_choice == 0
      player_score += 1
      break
    else
      enemy_score += 1
      break
    end
  end

  if player_score > enemy_score
    puts 'Итог: Победил игрок'
  elsif player_score < enemy_score
    puts 'Итог: Победил противник'
  end

  [player_score, enemy_score]
end
