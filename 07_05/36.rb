require 'minitest/autorun'

def unzip(arr)
  return unless arr.is_a?(Array)

  result = Array.new(arr[0].length) { |index| Array.new}

  arr.each do |n|
    n.each_with_index do |el, index|
      result[index] << el
    end
  end

  result
end

class Test < Minitest::Test
  def test_unzip_element_size_1
    assert_equal([[1, 2, 3]], unzip([[1], [2], [3]]))
  end

  def test_unzip_element_size_2
    assert_equal([[1, 2, 3], ["a", "b", "c"]], unzip([[1, 'a'], [2, 'b'], [3, 'c']]))
  end

  def test_unzip_element_size_3
    assert_equal([[1, 2, 3], ["a", "b", "c"], [1, 2, 3]], unzip([[1, 'a', 1], [2, 'b', 2], [3, 'c', 3]]))
  end

  def test_unzip_wrong_input
    assert_nil(unzip(1))
  end
end
