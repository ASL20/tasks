require 'minitest/autorun'

def max_2(array)
  return if array.length == 0

  max1 = -Float::INFINITY
  max2 = -Float::INFINITY

  index = 0
  previous_value = 0
  array.each do |num|
    previous_value = max1
    max1 = num if num > previous_value
    index += 1
  end

  index = 0
  previous_value = 0
  array.each do |num|
    previous_value = max2
    max2 = num if num < max1 && num > previous_value
    index += 1
  end
  [max1, max2]
end

class Test < Minitest::Test
  def test_max_2_correct_work
    assert_equal([3, 2], max_2([1, 1, 2, 3]))
  end

  def test_max_2_blank_array
    assert_nil(max_2([]))
  end
end
