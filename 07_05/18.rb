  # [a, b, c, d, e, a ] - [a, b] = [c, d, e, a]
require 'minitest/autorun'

def subtract_arrays(arr1, arr2)
  return unless arr1.is_a?(Array) || arr2.is_a?(Array)

  result = []
  index = 0
  arr1.each do |n|
    result << n if n != arr2[index]
    index += 1 if n == arr2[index]
  end
  result
end

class Test < Minitest::Test
  def test_subtract_arrays_correct_work
    assert_equal([3, 4, 5, 6], subtract_arrays([1, 2, 3, 4, 5, 6], [1, 2]))
  end

  def test_subtract_arrays_wrong_input
    assert_nil(subtract_arrays(1, 2))
  end
end
