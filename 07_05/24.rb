require 'minitest/autorun'

def find_number(array)
  return unless array.is_a?(Array)

  min = Float::INFINITY
  array.each do |n|
    previous_value = min
    min = n if min > previous_value
  end

  counter = 1
  array.each do |n|
    return counter unless array.include?(counter)
    counter += 1
  end
end

class Test < Minitest::Test
  def test_find_number_correct_work
    assert_equal(7, find_number([1, 3, 4, 2, 5, 6, 9, 8]))
  end

  def test_find_number_blank_array
    assert_equal([], find_number([]))
  end

  def test_find_number_wrong_input
    assert_nil(find_number(1))
  end
end
