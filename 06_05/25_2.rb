require 'minitest/autorun'

def max_sequence(str)
  return if str == ""
  index = 0
  arr = []

  while index < str.length
    arr << str[index]
    index += 1
  end

  current_counter = 0
  max_sequence = 0
  last_number = arr[0]

  arr.each do |el|
    if last_number == el
      last_number = el
      current_counter += 1
    else
      max_sequence = current_counter if current_counter > max_sequence
      current_counter = 1
    end
    last_number = el
  end
  max_sequence
end

class Test < Minitest::Test
  def test_max_sequence_correct_work
    string = "aaabbccccdd"
    assert_equal(4, max_sequence(string))
  end

  def test_max_sequence_blank_string
    assert_nil(max_sequence(""))
  end

  def test_max_sequence_array_input
    array = %w[ a a a b b c c c c d d ]
    assert_equal(4, max_sequence(array))
  end
end
