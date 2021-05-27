require 'byebug'
class Game
  attr_reader :body, :status

  def initialize
    @body = Array.new(3) { Array.new(3) }
    @status = false
  end

  def make_move(x, y, symbol)
    @body[y][x] = symbol
  end

  def check_status
    if @body[0][0] == 'x' && @body[1][0] == 'x' && @body[2][0] == 'x' ||
       @body[0][1] == 'x' && @body[1][1] == 'x' && @body[2][1] == 'x' ||
       @body[0][2] == 'x' && @body[1][2] == 'x' && @body[2][2] == 'x' ||
       @body[0][0] == 'x' && @body[0][1] == 'x' && @body[0][2] == 'x' ||
       @body[1][0] == 'x' && @body[1][1] == 'x' && @body[1][2] == 'x' ||
       @body[2][0] == 'x' && @body[2][1] == 'x' && @body[2][2] == 'x' ||
       @body[0][0] == 'x' && @body[1][1] == 'x' && @body[2][2] == 'x' ||
       @body[0][2] == 'x' && @body[1][1] == 'x' && @body[2][0] == 'x'
      puts 'Выиграл компьютер'
      @status == true
    elsif @body[0][0] == '0' && @body[1][0] == '0' && @body[2][0] == '0' ||
          @body[0][1] == '0' && @body[1][1] == '0' && @body[2][1] == '0' ||
          @body[0][2] == '0' && @body[1][2] == '0' && @body[2][2] == '0' ||
          @body[0][0] == '0' && @body[0][1] == '0' && @body[0][2] == '0' ||
          @body[1][0] == '0' && @body[1][1] == '0' && @body[1][2] == '0' ||
          @body[2][0] == '0' && @body[2][1] == '0' && @body[2][2] == '0' ||
          @body[0][0] == '0' && @body[1][1] == '0' && @body[2][2] == '0' ||
          @body[0][2] == '0' && @body[1][1] == '0' && @body[2][0] == '0'
      puts 'Выиграл игрок'
      @status = true
    else
      @status = false
    end
  end

  def print_state
    @body.each do |row|
      print row
      puts
    end
  end
end

game = Game.new
blank_cell = false

until game.status
  until blank_cell
    pc_array = [rand(3), rand(3), 'x']
    blank_cell = true if game.body[pc_array[1]][pc_array[0]].nil?
  end

  game.make_move(pc_array[0], pc_array[1], pc_array[2])
  game.print_state

  puts 'Сделайте ход, разделяя координаты и знак пробелами(0 1 x)'
  input = STDIN.gets.chomp
  input_array = input.split(' ')

  game.make_move(input_array[0].to_i, input_array[1].to_i, input_array[2])
  game.check_status
  blank_cell = false
end

game.print_state
