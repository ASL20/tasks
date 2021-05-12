require 'minitest/autorun'

def add_arrays(arr1, arr2)
  return unless arr1.is_a?(Array) || arr2.is_a?(Array)

  result_arr = []
  [arr1, arr2].each do |arr|
    arr.each do |n|
      result_arr << n
    end
  end
  result_arr
end

class Test < Minitest::Test
  def test_add_arrays_correct_work
    assert_equal([1, 2, 3, 4], add_arrays([1, 2], [3, 4]))
  end

  def test_add_arrays_wrong_input
    assert_nil(add_arrays(1, 2))
  end
end
