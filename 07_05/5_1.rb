require 'minitest/autorun'

def array_copying(array)
  return unless array.is_a?(Array)
  indexes = []

  new_array = []

  counter = 0
  while counter < array.length
    indexes << counter
    counter += 1
  end

  counter = 0
  while counter < indexes.length
    new_array[indexes[counter]] = array[indexes[counter]]
    counter += 1
  end
  new_array
end

class Test < Minitest::Test
  def test_array_copying_correct_work
    array = %w[ a b c d e f]
    result = %w[ a b c d e f]
    assert_equal(result, array_copying(array))
  end

  def test_array_copying_wrong_input
    assert_nil(array_copying(1))
  end
end
