require 'minitest/autorun'

def chess_board
  letters_array = %w[ a b c d e f g h ]
  numbers_array = [1, 2, 3, 4, 5, 6, 7, 8]
  array_length = numbers_array.length
  result = []

  # делаем строку с буквами
  temp_string = ""
  letters_array.each do |letter|
    temp_string << " #{letter}"
  end

  # складываем строку с буквами в массив
  result << " #{temp_string}\n"

  # добавляем верхнюю границу
  result << "  " + ("\u2581\u2581" * (array_length))

  # добавляем в массив непосредтсвенно доску с цифрами
  numbers_array.each do |number|
    result << "#{number}\u2595#{"\u2B1B\u2B1C" * 4}\u258F#{array_length + 1 - number}\n" unless number % 2 == 0
    result << "#{number}\u2595#{"\u2B1C\u2B1B" * 4}\u258F#{array_length + 1 - number}\n" if number % 2 == 0
    # result << "#{number}#{"\u2B1B\u2B1C" * 4}#{array_length + 1 - number}\n" unless number % 2 == 0
    # result << "#{number}#{"\u2B1C\u2B1B" * 4}#{array_length + 1 - number}\n" if number % 2 == 0
  end

  # добавляем нижнюю границу
  result << "  " + ("\u2594\u2594" * (array_length))

  # делаем зеркальную строку с буквами
  temp_string = ""
  numbers_array.each do |number|
    temp_string << " #{letters_array[-number]}"
  end

  # добавляем зеркальную строку с буквами в массив
  result << " #{temp_string}\n"

  # возвращаем результат
  result
end

class Test < Minitest::Test
  def test_chess_board_correct_work
    test_result = ["  a b c d e f g h\n",
                      "  ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁",
                      "1▕⬛⬜⬛⬜⬛⬜⬛⬜▏8\n",
                      "2▕⬜⬛⬜⬛⬜⬛⬜⬛▏7\n",
                      "3▕⬛⬜⬛⬜⬛⬜⬛⬜▏6\n",
                      "4▕⬜⬛⬜⬛⬜⬛⬜⬛▏5\n",
                      "5▕⬛⬜⬛⬜⬛⬜⬛⬜▏4\n",
                      "6▕⬜⬛⬜⬛⬜⬛⬜⬛▏3\n",
                      "7▕⬛⬜⬛⬜⬛⬜⬛⬜▏2\n",
                      "8▕⬜⬛⬜⬛⬜⬛⬜⬛▏1\n",
                      "  ▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔",
                      "  h g f e d c b a\n"]
    assert_equal(test_result, chess_board)
  end
end
