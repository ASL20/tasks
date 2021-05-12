require 'minitest/autorun'

def add_arrays(arr1, arr2)
  return unless arr1.is_a?(Array) || arr2.is_a?(Array)

  general_length = arr1.length + arr2.length

  n = arr1.length
  x = 0
  while n < general_length
    arr1[n] = arr2[x]
    n += 1
    x += 1
  end
  arr1
end

class Test < Minitest::Test
  def test_add_arrays_correct_work
    assert_equal([1, 2, 3, 4], add_arrays([1, 2], [3, 4]))
  end

  def test_add_arrays_wrong_input
    assert_nil(add_arrays(1, 2))
  end
end
