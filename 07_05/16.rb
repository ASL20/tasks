require 'minitest/autorun'

def chunk(array, number)
  result = []
  tmp = []
  counter = 1
  array.each do |el|
    tmp << el
    if counter % number == 0 || counter == array.length
      result << tmp
      tmp = []
    end
    counter += 1
  end
  result
end

class Test < Minitest::Test
  def test_chunk_array_divided_by_number
    assert_equal([[1, 2, 3], [4, 5, 6]], chunk([1, 2, 3, 4, 5, 6], 3))
  end

  def test_chunk_array_not_divided_by_number
  assert_equal([[1, 2, 3, 4], [5, 6]], chunk([1, 2, 3, 4, 5, 6], 4))
  end

  def test_chunk_blank_array
    assert_equal([], chunk([], 2))
  end
end
