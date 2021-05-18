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

def print_move_result(result, user_choice, bet_value)
  puts result ? "Вы поставили на '#{user_choice}' #{bet_value} - ставка выиграла" :
                "Вы поставили на '#{user_choice}' #{bet_value} - ставка проиграла"
end

def print_pc_move_result(result, pc_choice, pc_bet_value)
  puts result ? "ПК поставил на '#{pc_choice}' #{pc_bet_value} - ставка выиграла" :
                "ПК поставил на '#{pc_choice}' #{pc_bet_value} - ставка проиграла"
end

def print_status(balance, pc_balance)
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

balance = 1000
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

while status || balance > 10
  input = 0
  player_choice = -1
  bet_value = 0
  player2_bet_value = 0
  bet_type = 0
  player2_bet_type = 0
  pc_choice = [numbers.sample, 'red', 'black', 'even', 'odd'].sample if game_selection == 2
  pc_bet_value = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100].sample if game_selection == 2

  # выбираем действие игрока
  puts print_status(balance, pc_balance)
  until input.between?(1, 4)
    input = STDIN.gets.to_i
  end

  case input
  when 1
    until bet_type.between?(1, 3)
      puts print_bet_type
      bet_type = STDIN.gets.to_i
    end

    player_choice = print_choice_menu(bet_type)

    while bet_value < 10 || (balance - bet_value) < 0
      puts 'Введите сумму ставки (минимальная сумма ставки - 10)'
      bet_value = STDIN.gets.to_i

      if bet_value < 10
        puts "Вы хотели поставить #{bet_value}. Нужно поставить больше"
      elsif (balance - bet_value) < 0
        puts "Вы хотели поставить #{bet_value}. У вас нет столько денег, попробуйте поставить меньше"
      end
    end

    until player2_bet_type.between?(1, 3)
      puts print_bet_type
      player2_bet_type = STDIN.gets.to_i
    end

    player2_choice = print_choice_menu(player2_bet_type)

    while player2_bet_value < 10 || (balance - player2_bet_value) < 0
      puts 'Введите сумму ставки (минимальная сумма ставки - 10)'
      player2_bet_value = STDIN.gets.to_i

      if player2_bet_value < 10
        puts "Вы хотели поставить #{player2_bet_value}. Нужно поставить больше"
      elsif (balance - player2_bet_value) < 0
        puts "Вы хотели поставить #{player2_bet_value}. У вас нет столько денег, попробуйте поставить меньше"
      end
    end

    rotate_roulette

    dropped_number = select_number(numbers)
    dropped_combination = select_color(dropped_number)
    player_result = check_bet(player_choice, dropped_combination)
    player2_result = check_bet(player2_choice, dropped_combination) if game_selection == 3
    pc_result = check_bet(pc_choice, dropped_combination) if game_selection == 2

    print_combination(dropped_combination)
    print_move_result(player_result, player_choice, bet_value)
    print_move_result(player2_result, player2_choice, player2_bet_value) if game_selection == 3
    print_pc_move_result(pc_result, pc_choice, pc_bet_value) if pc_status && game_selection == 2

    puts "Выигрыш 1 игрока составляет #{calculate_balance(bet_value, player_result, player_choice)}" if player_result
    puts "Выигрыш 2 игрока составляет #{calculate_balance(player2_bet_value, player2_result, player2_choice)}" if player2_result && game_selection == 3
    puts "Выигрыш ПК составляет #{calculate_balance(pc_bet_value, pc_result, pc_choice)}" if pc_result && pc_status && game_selection == 2
    balance += calculate_balance(bet_value, player_result, player_choice)
    player2_balance += calculate_balance(player2_bet_value, player2_result, player2_choice) if game_selection == 3
    pc_balance += calculate_balance(pc_bet_value, pc_result, pc_choice) if pc_status && game_selection == 2

    puts "Баланс 1 игрока #{balance}"
    puts "Баланс 2 игрока #{player2_balance}" if game_selection == 3
    puts "Баланс ПК #{pc_balance}" if pc_status && game_selection == 2

    pc_status = false if pc_balance < 10 && game_selection == 2
    break if balance < 10
  when 2
    rotate_roulette

    dropped_number = select_number(numbers)
    dropped_combination = select_color(dropped_number)
    print_combination(dropped_combination)
  when 3
    print_balance(balance)
  when 4
    break
  end
end

summarize(balance)
