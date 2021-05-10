require 'minitest/autorun'

def count(array, object)
  return unless array.is_a?(Array)

  counter = 0
  array.each do |element|
    counter += 1 if element == object
  end
  counter if counter > 0
end

class Test < Minitest::Test
  def test_count_there_is_match
    array = [1, 2, 3, 2, 2, 4]
    assert_equal(3, count(array, 2))
  end

  def test_count_there_is_not_match
    array = [1, 2, 3, 2, 2, 4]
    assert_nil(count(array, 5))
  end

  def test_count_wrong_array
    assert_nil(count(2, 2))
  end
end
