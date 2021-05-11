require 'minitest/autorun'

def start_with_while?(param, word)
  index = 0
  while index < param.length
      if param[index] == word[index]
        result = true
      else
        result = false
        break
      end
    index += 1
  end
  result
end

def start_with_each?(param, word)
  index = 0
  param_arr = []
  while index < param.length
    param_arr << param[index]
    index += 1
  end

  index = 0
  result = nil
  param_arr.each do |letter|
    result =
      if param[index] == word[index]
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
  def test_start_with_while_matches
    assert_equal(true, start_with_while?('sub', 'suburban'))
  end

  def test_start_with_while_not_matches
    assert_equal(false, start_with_while?('stb', 'suburban'))
  end

  def test_start_with_while_wrong_input
    assert_raises(NoMethodError) { start_with_while?(10, 'suburban') }
  end

  def test_start_with_each_matches
    assert_equal(true, start_with_while?('sub', 'suburban'))
  end

  def test_start_with_each_not_matches
    assert_equal(false, start_with_each?('stbl', 'suburban'))
  end

  def test_start_with_each_wrong_input
    assert_raises(NoMethodError) { start_with_each?(10, 'suburban') }
  end
end
