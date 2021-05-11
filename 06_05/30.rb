require 'minitest/autorun'

def compare_numbers(conceived, answer)
  if answer > conceived
    'Нужно меньше'
  elsif answer < conceived
    'Нужно больше'
  else
    nil
  end
end

def print_result(number, attempts)
  if attempts == 3
    "Вы проиграли. Это было число: #{number}"
  else
    "Вы выиграли\nПотрачено попыток: #{attempts}"
  end
end

number = rand(100) + 1
attempts = 0

while attempts < 3
  attempts += 1

  puts 'Введите число от 1 до 100'
  input = STDIN.gets.to_i

  if compare_numbers(number, input).nil?
    break
  else
    puts compare_numbers(number, input)
  end
end

class Test < Minitest::Test
  def test_compare_numbers_hidden_number_is_greater
    assert_equal('Нужно больше', compare_numbers(50, 49))
  end

  def test_compare_numbers_hidden_number_is_less
    assert_equal('Нужно меньше', compare_numbers(49, 50))
  end

  def test_compare_numbers_hidden_number_equal
    assert_nil(compare_numbers(50, 50))
  end

  def test_print_result_won
    assert_equal("Вы проиграли. Это было число: #{50}", print_result(50, 3))
  end

  def test_print_result_lost
    assert_equal("Вы выиграли\nПотрачено попыток: #{2}", print_result(50, 2))
  end
end
