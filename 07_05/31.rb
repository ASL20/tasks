require 'minitest/autorun'

def zip(arr1, arr2)
  return unless arr1.is_a?(Array) || arr2.is_a?(Array)

  arr =
    arr1.length > arr2.length ? arr1 : arr2

  result =
    arr.map.with_index do |n, index|
      [
        arr1[index] || :empty,
        arr2[index] || :empty
      ]
    end
  result
end

class Test < Minitest::Test
  def test_zip_arrays_equal
    assert_equal([[1, 'a'], [2, 'b'], [3, 'c']], zip([1, 2, 3], ['a', 'b', 'c']))
  end

  def test_zip_a_more_b
    assert_equal([[1, 'a'], [2, 'b'], [3, :empty]], zip([1, 2, 3], ['a', 'b']))
  end

  def test_zip_b_more_a
    assert_equal([[1, 'a'], [2, 'b'], [:empty, 'c']], zip([1, 2], ['a', 'b', 'c']))
  end
end
