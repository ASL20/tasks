require 'byebug'

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

lost = 0
win = 0

previous_result = true

10000.times do

  balance = 1000
  status = true
  choice = 'red'
  bet_value = 50

  while true
    # byebug
    if previous_result == true
      if choice == 'red'
        choice = 'black'
      else
        choice = 'red'
      end
      bet_value = 1
    else
      break if bet_value * 2 > balance
      bet_value *= 2
    end


    # создаем выпавшую комбинацию
    dropped_number = select_number(numbers)
    dropped_combination = select_color(dropped_number)
    # puts "Вы ставили #{choice}. Размер ставки #{bet_value}"
    # puts "Выпало #{dropped_combination}"

    # проверяем - сыграла ставка или нет
    result = check_bet(choice, dropped_combination)

    balance += calculate_balance(bet_value, result, choice)

    if result
      previous_result = true
    else
      previous_result = false
    end

    # puts result
    # puts balance
    break if balance < 10 || balance >= 5000
  end

  lost += 1 if bet_value * 2 > balance
  win += 1 if balance >= 2000
end

puts "Выигрышей #{win}"
puts "Проигрышей #{lost}"

puts "Соотношение #{(win.to_f / 1000 * 100).round(2)}/#{(lost.to_f / 1000 * 100).round(2)}"
