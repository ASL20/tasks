require 'minitest/autorun'

def crossing(arr1, arr2)
  return unless (arr1.is_a?(Array) || arr2.is_a?(Array))

  result =
    arr1.map do |element|
      element if arr2.include?(element)
    end
  result.compact
end

class Test < Minitest::Test
  def test_crossing_correct_work
    assert_equal([1, 2, 5, 6], crossing([1, 2, 7, 8, 5, 6], [6, 5, 4, 3, 2, 1]))
  end

  def test_crossing_blank_array
    assert_equal([], crossing([], [1, 2]))
  end

  def test_crossing_wrong_input
    assert_nil(crossing(1, 2))
  end
end
