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

  while index < arr.length
    if index % 3 == 0
      arr[index] = 'ла'
      arr[index + 1] = 'ла' if index + 1 < arr.length
      arr[index + 2] = 'лей' if index + 2 < arr.length
    end
    index += 1
  end
  arr
end

class Test < Minitest::Test
  def test_iterator_correct_work_array
    array = %w[ a a a b b c c c c d ]
    result = %w[ ла ла лей ла ла лей ла ла лей ла ]
    assert_equal(result, iterator(array))
  end

  def test_iterator_correct_work_string
    string = "aaabbccccd"
    result = %w[ ла ла лей ла ла лей ла ла лей ла ]
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
