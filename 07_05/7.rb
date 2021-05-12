require 'minitest/autorun'

def count(array, object)
  return unless array.is_a?(Array)

  counter = 0
  index = 0
  while index < array.length
    counter += 1 if array[index] == object
    index += 1
  end
  counter
end

class Test < Minitest::Test
  def test_count_there_is_match
    array = [1, 2, 3, 2, 2, 4]
    assert_equal(3, count(array, 2))
  end

  def test_count_there_is_not_match
    array = [1, 2, 3, 2, 2, 4]
    assert_equal(0, count(array, 5))
  end

  def test_count_wrong_array
    assert_nil(count(2, 2))
  end
end
