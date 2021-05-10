require 'minitest/autorun'

def iterator(input)
  return if input == [] || input == ""

  if input.is_a?(String)
    index = 0
    arr = []
    while index < input.length
      arr << input[index]
      index += 1
    end
  elsif input.is_a?(Array)
    arr = input
  end

  index = 0
  result = []
  arr.each do |el|
    if index % 3 == 0
      result << el
      result << arr[index + 1] if index + 1 < arr.length
      result << arr[index + 2] if index + 2 < arr.length
    end
    index += 1
  end
  result
end

class Test < Minitest::Test
  def test_iterator_correct_work_array
    array = %w[ q w e r t y ]
    result = %w[ q w e r t y ]
    assert_equal(result, iterator(array))
  end

  def test_iterator_correct_work_string
    string = "qwerty"
    result = %w[ q w e r t y ]
    assert_equal(result, iterator(string))
  end

  def test_iterator_blank_string
    assert_nil(iterator(""))
  end

  def test_iterator_blank_array
    assert_nil(iterator([]))
  end

  def test_iterator_wrong_input
    wrong_input = 512
    assert_raises(NoMethodError) { iterator(512) }
  end
end
