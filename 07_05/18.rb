  # [a, b, c, d, e, a ] - [a, b] = [c, d, e, a]
require 'minitest/autorun'

def subtract_arrays(arr1, arr2)
  return unless arr1.is_a?(Array) || arr2.is_a?(Array)
  return arr1 if arr1.length == 0

  result = arr1
  arr2.each do |param|
    tmp = []
    blocked = true
    result.each do |element|
      if blocked
        tmp << element if element != param
      else
        tmp << element
      end
      blocked = false if element == param
    end
    result = tmp
  end
  result
end

class Test < Minitest::Test
  def test_subtract_arrays_correct_work
    assert_equal([4, 5, 6], subtract_arrays([1, 2, 3, 4, 5, 6], [2, 1, 3]))
  end

  def test_subtract_arrays_wrong_input
    assert_nil(subtract_arrays(1, 2))
  end
end
