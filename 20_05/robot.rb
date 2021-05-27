class Robot
  attr_accessor :body, :x_position, :y_position

  def initialize
    @body = Array.new(10) { |n| Array.new(10) }
    @x_position = 0
    @y_position = 0
  end

  def print_map
    @body.each do |n|
      print n
      puts
    end
  end

  def move
    move_parameters = yield

    if move_parameters[0] == :left
      move_result = @body[y_position].map.with_index do |cell, index|
        if index >= x_position - move_parameters[1] && index <= x_position
          cell = 'x'
        else
          cell
        end
      end
      @body[y_position] = move_result

      @body[y_position].each_with_index do |cell, index|
        @x_position = index if cell == 'x' && @body[y_position][index - 1].nil? || cell == 'x' && index == 0
      end
    elsif move_parameters[0] == :right
      move_result = @body[y_position].map.with_index do |cell, index|
        if index >= x_position && index <= x_position + move_parameters[1]
          cell = 'x'
        else
          cell
        end
      end
      @body[y_position] = move_result

      @body[y_position].each_with_index do |cell, index|
        @x_position = index if cell == 'x' || cell == 'x' && cell == @body[y_position].last
      end
    elsif move_parameters[0] == :up
      move_result = @body.map.with_index do |row, row_index|
        row.map.with_index do |cell, cell_index|
          if cell_index == x_position && (row_index >= y_position - move_parameters[1] && row_index <= y_position)
            cell = 'x'
          else
            cell
          end
        end
      end
      @body = move_result

      @body.each_with_index do |row, row_index|
        @y_position = row_index if row[x_position] == 'x' && @body[row_index - 1][x_position].nil? || row[x_position] == 'x' && row_index == 0
      end
    elsif move_parameters[0] == :down
      move_result = @body.map.with_index do |row, row_index|
        row.map.with_index do |cell, cell_index|
          if cell_index == x_position && (row_index >= y_position && row_index <= y_position + move_parameters[1])
            cell = 'x'
          else
            cell
          end
        end
      end
      @body = move_result

      @body.each_with_index do |row, row_index|
        @y_position = row_index if row[x_position] == 'x' || row[x_position] == 'x' && row == @body.last
      end
    end
  end
end

robot = Robot.new

robot.body[0][0] = 'x'
# robot.move { [:right, 2] }
# robot.move { [:down, 3] }
# robot.move { [:right, 2] }
# robot.move { [:right, 3] }
# robot.move { [:down, 2] }
# robot.move { [:left, 2] }
# robot.move { [:left, 2] }
# robot.move { [:down, 2] }
# robot.move { [:right, 2] }
# robot.move { [:right, 3] }
# robot.move { [:up, 3] }
# robot.move { [:left, 2] }
# robot.move { [:down, 5] }
robot.move { [:right, 3] }
robot.move { [:down, 2] }
robot.move { [:left, 50] }
robot.move { [:down, 50] }
robot.move { [:right, 50] }
robot.move { [:up, 50] }
robot.move { [:left, 2] }
robot.move { [:down, 3] }
robot.print_map


