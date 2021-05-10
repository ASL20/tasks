require 'minitest/autorun'

arr = [1, 2, 3, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6, 5, 5]

def max_sequence(arr)
  return if arr.empty?

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
    array = [-1, 0, 1, 1, 1, 2, 2]
    assert_equal(3, max_sequence(array))
  end

  def test_max_sequence_blank_array
    assert_nil(max_sequence([]))
  end

  def test_max_sequence_string_input
    string = "00011111555"
    assert_raises(NoMethodError) { max_sequence(string) }
  end
end
