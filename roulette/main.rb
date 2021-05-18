def calculate_balance(bet_value, result, choice)
  return output = 0 - bet_value unless result
  return output = bet_value * 10 if choice == 0

  case choice
  when Integer
    output = bet_value * 4
  when String
    output = bet_value * 2
  end
end

def check_bet(player_choice, game_combination)
  if player_choice.is_a?(Integer)
    player_choice == game_combination[0] ? true : false
  elsif player_choice == 'red' || player_choice == 'black'
    player_choice == game_combination[1] ? true : false
  elsif player_choice == 'even'
    game_combination[0].even? ? true : false
  elsif player_choice == 'odd'
    game_combination[0].odd? ? true : false
  end
end

def place_bet(balance)
  puts 'Введите сумму ставки (минимальная сумма ставки - 10)'
  player_bet_value = STDIN.gets.to_i

  if player_bet_value < 10
    puts "Вы хотели поставить #{player_bet_value}. Нужно поставить больше"
  elsif (balance - player_bet_value) < 0
    puts "Вы хотели поставить #{player_bet_value}. У вас нет столько денег, попробуйте поставить меньше"
  end
  player_bet_value
end

def print_balance(balance)
  puts "Ваш баланс #{balance}"
end

def print_bet_type
  <<~TYPE
    На что хотите поставить?
    1. Номер
    2. Красное/чёрное
    3. Чётное/нечётное
  TYPE
end

def print_choice_menu(bet_type)
  player_choice = -1

  case bet_type
  when 1
    until player_choice.between?(0, 36)
      puts 'Выберите число от 0 до 36'
      player_choice = STDIN.gets.to_i
    end
  when 2
    until player_choice == 'red' || player_choice == 'black'
      puts 'Введите red или black'
      player_choice = STDIN.gets.strip.downcase
    end
  when 3
    until player_choice == 'even' || player_choice == 'odd'
      puts 'Введите even или odd'
      player_choice = STDIN.gets.strip.downcase
    end
  end
  player_choice
end

def print_combination(combination)
  puts "Выпало число: #{combination[0]} #{combination[1]}."
end

def print_move_result(result, user_choice, bet_value, player)
  puts result ? "#{player} поставил на '#{user_choice}' #{bet_value} - ставка выиграла" :
                "#{player} поставил на '#{user_choice}' #{bet_value} - ставка проиграла"
end

def print_pc_move_result(result, pc_choice, pc_bet_value)
  puts result ? "ПК поставил на '#{pc_choice}' #{pc_bet_value} - ставка выиграла" :
                "ПК поставил на '#{pc_choice}' #{pc_bet_value} - ставка проиграла"
end

def print_status
  <<~STATUS
    ---------------------------
    Выберите действие:
    1. сделать ставку
    2. пропустить ход
    3. проверить текущий баланс
    4. выйти из игры
    ---------------------------
  STATUS
end

def rotate_roulette
  puts "\nРулетка вращается...\n\n"
  # sleep 3
end

def select_color(number)
  if number.zero?
    [number]
  elsif ((number.between?(1, 10) || number.between?(19, 28)) && number.odd?) ||
    ((number.between?(11, 18) || number.between?(29, 36)) && number.even?)
    [number, "red"]
  else
    [number, "black"]
  end
end

def select_number(roulette_numbers)
  roulette_numbers.sample
end

def summarize(balance)
  if balance > 1000
    puts "Спасибо за игру! Ваш итоговый выигрыш составил #{balance - 1000}"
  else
    puts "Спасибо за игру! У вас осталось #{balance}"
  end
end

numbers = [
  0, 32, 15, 19, 4, 21, 2, 25, 17,
  34, 6, 27, 13, 36, 11, 30, 8, 23,
  10, 5, 24, 16, 33, 1, 20, 14, 31,
  9, 22, 18, 29, 7, 28, 12, 35, 3, 26
]

player1_balance = 1000
player2_balance = 1000
pc_balance = 1000
status = true
pc_status = true

puts 'Добро пожаловать в наше казино!'
puts <<~MESSAGE
      Будете играть один, с ПК или вторым игроком?'
      1. Один
      2. ПК
      3. Два игрока
     MESSAGE
game_selection = STDIN.gets.to_i

while status || player1_balance > 10
  player1_input = 0
  player2_input = 0
  player1_choice = -1
  player1_bet_value = 0
  player2_bet_value = 0
  player1_bet_type = 0
  player2_bet_type = 0
  pc_choice = [numbers.sample, 'red', 'black', 'even', 'odd'].sample if game_selection == 2
  pc_bet_value = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100].sample if game_selection == 2

  # выбираем действие игрока
  puts print_status
  until player1_input.between?(1, 4)
    player1_input = STDIN.gets.to_i
  end

  if game_selection == 3
    puts print_status
    until player2_input.between?(1, 4)
      player2_input = STDIN.gets.to_i
    end
  end

  if player1_input == 4 && player2_input == 4 ||
     player1_input == 4 && game_selection == 1 ||
     player1_input == 4 && game_selection == 2
    break
  elsif player1_input == 3 && player2_input == 3
    print_balance(player1_balance)
    print_balance(player2_balance)
  elsif player1_input == 3
    print_balance(player1_balance)
  elsif player2_input == 3
    print_balance(player2_balance)
  elsif player1_input == 2 && player2_input == 2 ||
        player1_input == 2 && game_selection == 1 ||
        player1_input == 2 && game_selection == 2
    rotate_roulette

    dropped_number = select_number(numbers)
    dropped_combination = select_color(dropped_number)
    print_combination(dropped_combination)
  elsif player1_input == 1 || player2_input == 1
    if player1_input == 1
      until player1_bet_type.between?(1, 3)
        puts print_bet_type
        player1_bet_type = STDIN.gets.to_i
      end

      #выбираем на что поставить 1 игроку
      player1_choice = print_choice_menu(player1_bet_type)

      while player1_bet_value < 10 || (player1_balance - player1_bet_value) < 0
        player1_bet_value = place_bet(player1_balance)
      end
    end

    if player2_input == 1
      until player2_bet_type.between?(1, 3)
        puts print_bet_type
        player2_bet_type = STDIN.gets.to_i
      end

      # Выбираем на что поставить 2 игроку
      player2_choice = print_choice_menu(player2_bet_type)

      while player2_bet_value < 10 || (player2_balance - player2_bet_value) < 0
        player2_bet_value = place_bet(player2_balance)
      end
    end

    # имитируем вращение рулетки
    rotate_roulette

    # создаем выпавшую комбинацию
    dropped_number = select_number(numbers)
    dropped_combination = select_color(dropped_number)

    # проверяем - сыграла ставка или нет
    player1_result = check_bet(player1_choice, dropped_combination) if player1_input == 1
    player2_result = check_bet(player2_choice, dropped_combination) if player2_input == 1
    pc_result = check_bet(pc_choice, dropped_combination) if game_selection == 2

    # выводим выпавшую комбинацию и результат ставки
    print_combination(dropped_combination)
    print_move_result(player1_result, player1_choice, player1_bet_value, 'player1') if player1_input == 1
    print_move_result(player2_result, player2_choice, player2_bet_value, 'player2') if player2_input == 1
    print_pc_move_result(pc_result, pc_choice, pc_bet_value) if pc_status && game_selection == 2

    puts "Выигрыш 1 игрока составляет #{calculate_balance(player1_bet_value, player1_result, player1_choice)}" if player1_result
    puts "Выигрыш 2 игрока составляет #{calculate_balance(player2_bet_value, player2_result, player2_choice)}" if player2_result && player2_input == 1
    puts "Выигрыш ПК составляет #{calculate_balance(pc_bet_value, pc_result, pc_choice)}" if pc_result && pc_status && game_selection == 2

    player1_balance += calculate_balance(player1_bet_value, player1_result, player1_choice)
    player2_balance += calculate_balance(player2_bet_value, player2_result, player2_choice) if player2_input == 1
    pc_balance += calculate_balance(pc_bet_value, pc_result, pc_choice) if pc_status && game_selection == 2

    puts "Баланс 1 игрока #{player1_balance}"
    puts "Баланс 2 игрока #{player2_balance}" if game_selection == 3
    puts "Баланс ПК #{pc_balance}" if pc_status && game_selection == 2

    pc_status = false if pc_balance < 10 && game_selection == 2
    break if player1_balance < 10
  end
end

summarize(player1_balance)
