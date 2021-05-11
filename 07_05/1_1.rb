require 'minitest/autorun'

def end_with_while?(param, word)
  index = -1
  count = 0
  while count < param.length
    if param[index] == word[index]
      result = true
    else
      result = false
      break
    end
    index -= 1
    count += 1
  end
  result
end

def end_with_each?(param, word)
  param_arr = []
  word_arr = []

  index = -1
  count = 0
  while count < param.length
    param_arr << param[index]
    index -= 1
    count += 1
  end

  index = -1
  count = 0
  while count < word.length
    word_arr << word[index]
    index -= 1
    count += 1
  end

  index = 0
  result = nil
  param_arr.each do |letter|
    if letter == word_arr[index]
      result = true
    else
      result = false
      break
    end
    index += 1
  end
  result
end

class Test < Minitest::Test
  def test_end_with_while_matches
    assert_equal(true, end_with_while?('ban', 'suburban'))
  end

  def test_end_with_while_not_matches
    assert_equal(false, end_with_while?('bab', 'suburban'))
  end

  def test_end_with_while_wrong_input
    assert_raises(NoMethodError) { end_with_while?(10, 'suburban') }
  end

  def test_end_with_each_matches
    assert_equal(true, end_with_each?('ban', 'suburban'))
  end

  def test_end_with_each_not_matches
    assert_equal(false, end_with_each?('bag', 'suburban'))
  end

  def test_end_with_each_wrong_input
    assert_raises(NoMethodError) { end_with_each?(10, 'suburban') }
  end
end
