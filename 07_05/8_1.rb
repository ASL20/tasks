require 'minitest/autorun'

def index(array, object)
  return unless array.is_a?(Array)

  index = 0
  result = nil
  array.each do |el|
    result = index if object == el
    break if result == index
    index += 1
  end
  result
end

class Test < Minitest::Test
  def test_index_there_is_match
    array = [1, 2, 3, 2]
    assert_equal(1, index(array, 2))
  end

  def test_index_no_is_match
    array = [1, 2, 3, 2]
    assert_nil(index(array, 5))
  end

  def test_index_wrong_input
    assert_nil(index(5, 5))
  end
end
