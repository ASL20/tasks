require 'minitest/autorun'

def find_index(array, object)
  return unless (array.is_a?(Array) && array.any?) || array.is_a?(Array)

  result = []
  array.each do |n|
    result << n if n == object
  end
  result
end

class Test < Minitest::Test
  def test_find_index_there_is_match
    array = [1, 2, 3, 2]
    assert_equal([2, 2], find_index(array, 2))
  end

  def test_find_index_no_is_match
    array = [1, 2, 3, 2]
    assert_equal([], find_index(array, 5))
  end

  def test_find_index_wrong_input
    assert_nil(find_index(5, 5))
  end
end
