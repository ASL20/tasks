# ( \u0028 ) \u0029 [ \u005B ] \u005D { \u007B } \u007D

require 'minitest/autorun'

def brackets_equal(string)
  return unless string.is_a?(String)

  array = string.chars

  breaker = array.length / 2
  counter = 0
  result = true
  if array.length.odd?
    result = false
  else
    array.each_with_index do |n, index|
      break if counter >= breaker
      result = false unless n == "(" && array[-index - 1] == ")" ||
                            n == "[" && array[-index - 1] == "]" ||
                            n == "{" && array[-index - 1] == "}"

      counter += 1
    end
  end
  result
end

class Test < Minitest::Test
  def test_brackets_equal_there_is_match
    assert_equal(true, brackets_equal("()"))
    assert_equal(true, brackets_equal("(({}))"))
    assert_equal(true, brackets_equal("(())"))
  end
  def test_brackets_equal

  end
  def test_brackets_equal_there_is_no_match
    assert_equal(false, brackets_equal("(("))
  end
end
