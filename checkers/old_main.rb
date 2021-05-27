require 'byebug'
require_relative 'checker'
require_relative 'player'
require_relative 'board'

player1 = Player.new

player1.checkers = [
  Checker.new(player1, "\u26C2", 0, 1),
  Checker.new(player1, "\u26C2", 1, 1),
  Checker.new(player1, "\u26C2", 2, 1),
  Checker.new(player1, "\u26C2", 3, 1),
  Checker.new(player1, "\u26C2", 4, 1),
  Checker.new(player1, "\u26C2", 5, 1),
  Checker.new(player1, "\u26C2", 6, 1),
  Checker.new(player1, "\u26C2", 7, 1)
]

player2 = Player.new

player2.checkers = [
  Checker.new(player2, "\u26C0", 0, 1),
  Checker.new(player2, "\u26C0", 1, 1),
  Checker.new(player2, "\u26C0", 2, 1),
  Checker.new(player2, "\u26C0", 3, 1),
  Checker.new(player2, "\u26C0", 4, 1),
  Checker.new(player2, "\u26C0", 5, 1),
  Checker.new(player2, "\u26C0", 6, 1),
  Checker.new(player2, "\u26C0", 7, 1)
]

board = Board.new(player1, player2)
board.print_body
counter = 0
player1_status = false
player2_status = false

loop do
  player_move = false
  enemy_checker_coordinates = false

  if counter % 2 == 0
    current_player = player1
  else
    current_player = player2
  end

  until player_move
    if current_player == player1
      puts 'Игрок 1. Введите свой ход'
    else
      puts 'Игрок 2. Введите свой ход'
    end
    player_input = STDIN.gets.strip
    player_coordinates = board.get_coordinates(player_input)
    player_pre_coordinates = player_coordinates.first
    player_new_coordinates = player_coordinates.last

    next_cage = board.select_next_cage(player_new_coordinates, current_player)

    if board.check_cage(player_pre_coordinates) && board.check_move(player_coordinates, current_player) == :straight_move
      board.make_move(player_pre_coordinates, player_new_coordinates)
      board.update_board(player_pre_coordinates)
      player_move = true
    elsif board.check_cage(player_pre_coordinates) && board.check_move(player_coordinates, current_player) == :diagonal_move
      enemy_checker_coordinates = board.find_enemy_checker(player_pre_coordinates, player_new_coordinates, current_player)
      board.make_move(player_pre_coordinates, player_new_coordinates)
      board.update_board(player_pre_coordinates)
      board.update_board(enemy_checker_coordinates)
      player_move = true
    else
      puts 'Неправильный ход'
    end
  end
  board.print_body

  unless enemy_checker_coordinates
    if next_cage.is_a?(Checker) && next_cage.owner != current_player
      rand_number = rand(2)
      if rand_number == 0
        if current_player == player1
          board.update_board([player_new_coordinates.first, player_new_coordinates.last + 1])
          sleep 1
          board.print_body
        else
          board.update_board([player_new_coordinates.first, player_new_coordinates.last - 1])
          sleep 1
          board.print_body
        end
      else
        board.update_board([player_new_coordinates.first, player_new_coordinates.last])
        sleep 1
        board.print_body
      end
    end
  end

  case current_player
  when player1
    checkers_count = 0
    board.body.each do |row|
      row.each do |cage|
        if cage.is_a?(Checker) && cage.owner == player2
          checkers_count += 1
        end
      end
    end
    condition_1 = true if checkers_count.zero?

    checkers_count = 0
    last_row = false
    board.body.each_with_index do |row, index|
      if index < board.body.size - 1
        row.each do |cage|
          if cage.is_a?(Checker) && cage.owner == player1
            checkers_count += 1
          end
        end
      else
        row.each do |cage|
          last_row = true if cage.is_a?(Checker) || cage.is_a?(String)
        end
      end
    end
    condition_2 = true if checkers_count.zero? && last_row
    player1_status = true if condition_1 || condition_2
  when player2
    checkers_count = 0
    board.body.each do |row|
      row.each do |cage|
        if cage.is_a?(Checker) && cage.owner == player1
          checkers_count += 1
        end
      end
    end
    condition_1 = true if checkers_count.zero?

    checkers_count = 0
    first_row = false
    board.body.each_with_index do |row, index|
      if index.zero?
        row.each do |cage|
          first_row = true if cage.is_a?(Checker) || cage.is_a?(String)
        end
      else
        row.each do |cage|
          if cage.is_a?(Checker) && cage.owner == player2
            checkers_count += 1
          end
        end
      end
    end
    condition_2 = true if checkers_count.zero? && first_row
    player2_status = true if condition_1 || condition_2
  end
  counter += 1
end

if player1_status
  puts 'Победил 1 игрок'
else
  puts 'Победил 2 игрок'
end
