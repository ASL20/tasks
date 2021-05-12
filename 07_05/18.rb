  # [a, b, c, d, e, a ] - [a, b] = [c, d, e, a]
require 'minitest/autorun'

def subtract_arrays(arr1, arr2)
  return unless arr1.is_a?(Array) || arr2.is_a?(Array)
  return arr1 if arr1.length == 0
  result = []
  result[0] = arr1
  arr2.each do |s|
    tmp = []
    index = 0
    n = 0
    result[index].each do |f|
      if n == 0
        tmp << f if f != s
      else
        tmp << f
      end
      n += 1 if f == s
    end
    result[index] = tmp
    index += 1
  end
  result.last
end

class Test < Minitest::Test
  def test_subtract_arrays_correct_work
    assert_equal([4, 5, 6], subtract_arrays([1, 2, 3, 4, 5, 6], [2, 1, 3]))
  end

  def test_subtract_arrays_wrong_input
    assert_nil(subtract_arrays(1, 2))
  end
end
