require 'minitest/autorun'

require_relative '8'

def find_index(array, object)
  index(array, object)
end

class Test < Minitest::Test
  def test_find_index_there_is_match
    array = [1, 2, 3, 2]
    assert_equal(1, find_index(array, 2))
  end

  def test_find_index_no_is_match
    array = [1, 2, 3, 2]
    assert_nil(find_index(array, 5))
  end

  def test_find_index_wrong_input
    assert_nil(find_index(5, 5))
  end
end
