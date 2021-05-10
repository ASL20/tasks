require 'minitest/autorun'

def chars(string)
  return unless string.is_a?(String)

  result = []
  indexes = []

  index = 0
  while index < string.length
    indexes << string[index]
    index += 1
  end

  indexes.each { |index| result << string[index] }
  result
end

class Test < Minitest::Test
  def test_chars_correct_work
    string = "Хэллоу"
    result = %w[ Х э л л о у]
    assert_equal(result, chars(string))
  end

  def test_chars_wrong_input
    assert_nil(chars(50))
  end
end
