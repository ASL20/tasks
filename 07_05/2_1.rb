require 'minitest/autorun'

def map(array, multiplier)
  return unless array.is_a?(Array) &&
                  (multiplier.is_a?(Integer) ||
                  multiplier.is_a?(Float))

  result_array = []
  array.each do |number|
    result_array << number * multiplier
  end
  result_array
end

class Test < Minitest::Test
  def test_map_correct_work
    assert_equal([3, 6, 9], map([1, 2, 3], 3))
  end

  def test_map_wrong_input
    assert_nil(map(1, 2))
  end

  def test_map_array_with_strings
    array = %w[ a b c ]
    assert_equal(%w[ aa bb cc ], map(array, 2))
  end
end
