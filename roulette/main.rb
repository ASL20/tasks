def select_number(roulette_numbers)
  roulette_numbers.sample
end

def rotate_roulette
  puts "\nРулетка вращается...\n\n"
  sleep 3
end

def select_color(number)
  if number.zero?
    number
  elsif ((number.between?(1, 10) || number.between?(19, 28)) && number.odd?) ||
    ((number.between?(11, 18) || number.between?(29, 36)) && number.even?)
    "#{number} red"
  else
    "#{number} black"
  end
end

def check_bet(player_number, game_number)
  player_number == game_number ? true : false
end

def print_combination(dropped_combination)
  puts "Выпало число: #{dropped_combination}."
end

def print_move_result(result)
  puts result ? "Ваша ставка выиграла" : "Ваша ставка проиграла"
end

def calculate_win(bet_value)
  puts "Ваш выигрыш составляет #{bet_value * 2}"
end

def print_balance(balance)
  puts "Ваш баланс #{balance}"
end

def summarize(balance)
  if balance > 1000
    puts "Спасибо за игру! Ваш итоговый выигрыш составил #{balance - 1000}"
  else
    puts "Спасибо за игру!"
  end
end



def print_status(balance)
  <<~STATUS
    ---------------------------
    Ваш баланс: #{balance}
    Выберите действие:
    1. сделать ставку
    2. пропустить ход
    3. проверить текущий баланс
    4. выйти из игры
    ---------------------------
  STATUS
end

numbers = [
  0, 32, 15, 19, 4, 21, 2, 25, 17,
  34, 6, 27, 13, 36, 11, 30, 8, 23,
  10, 5, 24, 16, 33, 1, 20, 14, 31,
  9, 22, 18, 29, 7, 28, 12, 35, 3, 26
]

balance = 1000
status = true

puts 'Добро пожаловать в наше казино!'
while status || balance > 10
  input = 0
  player_number = -1
  bet_value = 0

  puts print_status(balance)
  until input.between?(1, 4)
    input = STDIN.gets.to_i
  end

  case input
  when 1
    until player_number.between?(0, 36)
      puts 'Выберите число от 0 до 36'
      player_number = STDIN.gets.to_i
    end

    while bet_value < 10 || (balance - bet_value) < 0
      puts 'Введите сумму ставки (минимальная сумма ставки - 10)'
      bet_value = STDIN.gets.to_i
    end

    rotate_roulette

    dropped_number = select_number(numbers)
    dropped_combination = select_color(dropped_number)
    result = check_bet(player_number, dropped_number)

    if result
      print_combination(dropped_combination)
      print_move_result(result)
      calculate_win(bet_value)
      balance += bet_value * 2
    else
      print_combination(dropped_combination)
      print_move_result(result)
      balance -= bet_value
    end
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

summarize
