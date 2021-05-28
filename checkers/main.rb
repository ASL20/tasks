require_relative 'checker'
require_relative 'player'
require_relative 'board'
require_relative 'rps'

player1 = Player.new('Игрок 1', Array.new(8, Checker.new(player1, "\u26C2")))
player2 = Player.new('Игрок 2', Array.new(8, Checker.new(player2, "\u26C0")))
puts "Хотите начать новую игру или загрузить старую?(new/old)"
game_input = STDIN.gets.strip

board = Board.new(player1, player2)

case game_input
when 'new'
  0
when 'old'
  counter = board.load_game
end

board.print_body
log = File.new('log.txt', 'a')

loop do
  player_move = false
  enemy_checker_coordinates = false
  current_player = board.select_current_player(counter)
  unactive_player = board.select_current_player(counter + 1)

  until player_move
    puts board.suggest_input(current_player)

    player_input = STDIN.gets.strip
    if player_input == 'save'
      board.save_game(counter)
    end

    player_coordinates = board.get_coordinates(player_input)
    checked_move = board.check_move(player_coordinates, current_player)
    player_pre_coordinates = player_coordinates.first
    player_new_coordinates = player_coordinates.last
    checked_cage = board.check_cage(player_pre_coordinates)

    next_cage = board.select_next_cage(player_new_coordinates, current_player)

    if checked_cage && checked_move == :straight_move
      board.make_move(player_pre_coordinates, player_new_coordinates)
      board.update_board(player_pre_coordinates)
      player_move = true
    elsif checked_cage && checked_move == :diagonal_move
      enemy_checker_coordinates = board.find_enemy_checker(player_pre_coordinates, player_new_coordinates, current_player)
      board.make_move(player_pre_coordinates, player_new_coordinates)
      board.update_board(player_pre_coordinates)
      board.update_board(enemy_checker_coordinates)
      board.reduce_checkers(unactive_player)
      player_move = true
    else
      puts 'Неправильный ход'
    end
  end
  board.write_log(log, current_player, player_input, counter)
  board.print_body

  unless enemy_checker_coordinates
    board.resolve_conflict(player_new_coordinates, current_player, next_cage)
  end

  players_status = board.select_winner(current_player)
  break if players_status.include?(true)
  counter += 1
end

file.close

if players_status.first
  puts 'Победил 1 игрок'
else
  puts 'Победил 2 игрок'
end
