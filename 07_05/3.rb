require 'minitest/autorun'

def chess_board
  letters_array = %w[ a b c d e f g h ]
  result = []
  array_length = letters_array.length

  # задаем строку с буквами
  letters_counter = 0
  temp_string = ""
  while letters_counter < array_length
    temp_string << " #{letters_array[letters_counter]}"
    letters_counter += 1
  end

  # кладем эту строку в массив
  result << "#{temp_string}\n"

  # Заполняем массив непосредственно квадратами с цифрами
  counter = 1
  while counter <= array_length
    result << "#{counter}#{"\u2B1B\u2B1C" * 4}#{array_length + 1 - counter}\n" unless counter % 2 == 0
    result << "#{counter}#{"\u2B1C\u2B1B" * 4}#{array_length + 1 - counter}\n" if counter % 2 == 0
    counter += 1
  end

  # делаем реверс строки с буквами
  string_counter = 1
  reverse_string = " "
  while string_counter <= temp_string.length
    reverse_string << "#{temp_string[-string_counter]}"
    string_counter += 1
  end

  # добавляем зеркальную строку в массив
  result << "#{reverse_string.chop}\n"
  # возвращаем результат
  result
end

class Test < Minitest::Test
  def test_chess_board_correct_work
    test_result = [" a b c d e f g h\n",
                  "1⬛⬜⬛⬜⬛⬜⬛⬜8\n",
                  "2⬜⬛⬜⬛⬜⬛⬜⬛7\n",
                  "3⬛⬜⬛⬜⬛⬜⬛⬜6\n",
                  "4⬜⬛⬜⬛⬜⬛⬜⬛5\n",
                  "5⬛⬜⬛⬜⬛⬜⬛⬜4\n",
                  "6⬜⬛⬜⬛⬜⬛⬜⬛3\n",
                  "7⬛⬜⬛⬜⬛⬜⬛⬜2\n",
                  "8⬜⬛⬜⬛⬜⬛⬜⬛1\n",
                  " h g f e d c b a\n"]
    assert_equal(test_result, chess_board)
  end
end

  # 16.times do
  #   print "\u2594"
  # end

# \u2595\u2594\u258f
