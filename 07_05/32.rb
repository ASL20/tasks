require 'minitest/autorun'

def zip(arr1, arr2, arr3)
  return unless arr1.is_a?(Array) || arr2.is_a?(Array) || arr3.is_a?(Array)

  arr = arr1.length > arr2.length ? arr1 : arr2
  max_arr = arr3.length > arr.length ? arr3 : arr

  result =
    max_arr.map.with_index do |n, index|
      [
        arr1[index] || :empty,
        arr2[index] || :empty,
        arr3[index] || :empty
      ]
    end
  result
end

class Test < Minitest::Test
  def test_zip_arrays_equal
    assert_equal([[1, 'a', 'd'], [2, 'b', 'e'], [3, 'c', 'f']], zip([1, 2, 3], ['a', 'b', 'c'], ['d', 'e', 'f']))
  end

  def test_zip_a_more_b
    assert_equal([[1, 'a', 'd'], [2, 'b', 'e'], [3, :empty, 'f']], zip([1, 2, 3], ['a', 'b'], ['d', 'e', 'f']))
  end

  def test_zip_a_more_c
    assert_equal([[1, 'a', 'd'], [2, 'b', 'e'], [3, 'c', :empty]], zip([1, 2, 3], ['a', 'b', 'c'], ['d', 'e']))
  end

  def test_zip_b_and_c_more_a
    assert_equal(
      [[1, 'a', 'e'], [2, 'b', 'f'], [3, 'c', 'g'], [:empty, 'd', 'h']],
      zip([1, 2, 3], ['a', 'b', 'c', 'd'], ['e', 'f', 'g', 'h'])
    )
  end
end
