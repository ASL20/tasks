class Board
  attr_accessor :body

  def initialize(player1, player2)
    @body = [
      ["\u2B1B", "\u2B1C", "\u2B1B", "\u2B1C", "\u2B1B", "\u2B1C", "\u2B1B", "\u2B1C"],
      player1.checkers,
      ["\u2B1B", "\u2B1C", "\u2B1B", "\u2B1C", "\u2B1B", "\u2B1C", "\u2B1B", "\u2B1C"],
      ["\u2B1C", "\u2B1B", "\u2B1C", "\u2B1B", "\u2B1C", "\u2B1B", "\u2B1C", "\u2B1B"],
      ["\u2B1B", "\u2B1C", "\u2B1B", "\u2B1C", "\u2B1B", "\u2B1C", "\u2B1B", "\u2B1C"],
      ["\u2B1C", "\u2B1B", "\u2B1C", "\u2B1B", "\u2B1C", "\u2B1B", "\u2B1C", "\u2B1B"],
      player2.checkers,
      ["\u2B1C", "\u2B1B", "\u2B1C", "\u2B1B", "\u2B1C", "\u2B1B", "\u2B1C", "\u2B1B"]
    ]
    @x_coordinates = %w[a b c d e f g h]
    @player1 = player1
    @player2 = player2
  end

  def write_log(file, player, move, counter)
    file.puts "#{counter + 1}: #{player.name} сделал ход #{move}"
  end

  def suggest_input(player)
    player == @player1 ? 'Игрок 1. Введите свой ход' : 'Игрок 2. Введите свой ход'
  end

  def resolve_conflict(new_coordinates, player, next_cage)
    if next_cage.is_a?(Checker) && next_cage.owner != player
      result = rps
      if result == [1, 0]
        if player == @player1
          update_board([new_coordinates.first, new_coordinates.last + 1])
        else
          update_board([new_coordinates.first, new_coordinates.last - 1])
        end
      else
        update_board([new_coordinates.first, new_coordinates.last])
      end
      sleep 1
      print_body
    end
  end

  def select_current_player(counter)
    counter % 2 == 0 ? @player1 : @player2
  end

  def select_winner(player)
    checkers_count = 0
    @body.each do |row|
      row.each do |cage|
        if cage.is_a?(Checker) && cage.owner != player
          checkers_count += 1
        end
      end
    end
    condition_1 = true if checkers_count == 0

    checkers_count = 0
    case player
    when @player1
      player_checkers = 0
      last_row = false
      @body.each_with_index do |row, index|
        if index < @body.size - 1
          row.each do |cage|
            if cage.is_a?(Checker) && cage.owner == player
              checkers_count += 1
            end
          end
        else
          checkers_count = 0
          row.each do |cage|
            player_checkers += 1 if cage.is_a?(Checker) && cage.owner == player
          end
          last_row = true unless player_checkers.zero?
        end
      end
      condition_2 = true if checkers_count.zero? && last_row
      player1_status = true if condition_1 || condition_2
    when @player2
      player_checkers = 0
      first_row = false
      @body.each_with_index do |row, index|
        if index.zero?
          row.each do |cage|
            player_checkers += 1 if cage.is_a?(Checker) && cage.owner == player
          end
          first_row = true unless player_checkers.zero?
        else
          checkers_count = 0
          row.each do |cage|
            if cage.is_a?(Checker) && cage.owner == player
              checkers_count += 1
            end
          end
        end
      end
      condition_2 = true if checkers_count.zero? && first_row
      player2_status = true if condition_1 || condition_2
    end
    [player1_status, player2_status]
  end

  def check_move(coordinates, current_player)
    case current_player
    when @player1
      if (coordinates[0][1] - coordinates[1][1] == -1 && coordinates[0][0] == coordinates[1][0])
        :straight_move
      elsif (coordinates[0][1] - coordinates[1][1] == -2 &&
        (coordinates[0][0] - coordinates[1][0] == -2 || coordinates[0][0] - coordinates[1][0] == 2))
        :diagonal_move
      else
        false
      end
    when @player2
      if (coordinates[0][1] - coordinates[1][1] == 1 && coordinates[0][0] == coordinates[1][0])
        :straight_move
      elsif (coordinates[0][1] - coordinates[1][1] == 2 &&
        (coordinates[0][0] - coordinates[1][0] == -2 || coordinates[0][0] - coordinates[1][0] == 2))
        :diagonal_move
      else
        false
      end
    end
  end

  def find_enemy_checker(pre_coordinates, new_coordinates, player)
    case player
    when @player1
      if pre_coordinates.first < new_coordinates.first
        [new_coordinates.first - 1, new_coordinates.last - 1]
      else
        [new_coordinates.first + 1, new_coordinates.last - 1]
      end
    when @player2
      if pre_coordinates.first < new_coordinates.first
        [new_coordinates.first - 1, new_coordinates.last + 1]
      else
        [new_coordinates.first + 1, new_coordinates.last + 1]
      end
    end
  end

  def select_next_cage(new_coordinates, player)
    case player
    when @player1
      @body[new_coordinates.last + 1][new_coordinates.first]
    when @player2
      @body[new_coordinates.last - 1][new_coordinates.first]
    end
  end

  def print_body
    puts '  A B C D E F G H'
    @body.each_with_index do |row, index|
      print "#{index + 1} "
      row.each do |cage|
        print cage unless cage.is_a?(Checker)
        print "#{cage.color} " if cage.is_a?(Checker)
      end
      puts
    end
  end

  def get_coordinates(coordinates)
    positions = coordinates.split('-')
    pre_position = positions.first.chars
    pre_x_position = @x_coordinates.index(pre_position.first)
    pre_y_position = pre_position.last.to_i - 1
    new_position = positions.last.chars
    new_x_position = @x_coordinates.index(new_position.first)
    new_y_position = new_position.last.to_i - 1
    [[pre_x_position, pre_y_position], [new_x_position, new_y_position]]
  end

  def make_move(pre_coordinates, new_coordinates)
    @body[new_coordinates.last][new_coordinates.first] = @body[pre_coordinates.last][pre_coordinates.first]
  end

  def check_cage(pre_coordinates)
    @body[pre_coordinates.last][pre_coordinates.first].is_a?(Checker) ? true : false
  end

  def update_board(pre_coordinates)
    if pre_coordinates.last % 2 == 0 && pre_coordinates.first % 2 == 0 ||
      pre_coordinates.last % 2 != 0 && pre_coordinates.first % 2 != 0
      @body[pre_coordinates.last][pre_coordinates.first] = "\u2B1B"
    else
      @body[pre_coordinates.last][pre_coordinates.first] = "\u2B1C"
    end
  end
end
