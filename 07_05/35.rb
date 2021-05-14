require 'minitest/autorun'

def add_key_value(arr, key, value)
  result = []
  if arr.length == 0
    result << [key, value]
  else
      result = arr.map { |n| n.include?(key) ? [key, value] : n }
      result << [key, value] unless result.include?([key, value])
  end
  result
end

def remove_key_value(arr, key)
  return if arr.empty?

  result = []
  arr.each do |n|
    result << n unless n.include?(key)
  end
  result
end

def print_all_keys(arr)
  result = []
  arr.each do |n|
    result << n[0]
  end
  result
end

def print_all_values(arr)
  result = []
  arr.each do |n|
    result << n[1]
  end
  result
end

class Test < Minitest::Test
  def test_add_key_value_to_blank_array
    assert_equal([['key', 'value']], add_key_value([], 'key', 'value'))
  end

  def test_add_key_value_to_not_blank_array
    assert_equal([['key', 'value'], ['key1', 'value1']], add_key_value([['key', 'value']], 'key1', 'value1'))
  end

  def test_add_key_value_to_not_blank_array_with_the_same_key
    assert_equal([['key', 'eulav']], add_key_value([['key', 'value']], 'key', 'eulav'))
  end

  def test_remove_key_value
    assert_equal([['key', 'value']], remove_key_value([['key', 'value'], ['key1', 'value1']], 'key1'))
  end

  def test_remove_key_value_from_blank_array
    assert_nil(remove_key_value([], 'key1'))
  end

  def test_print_all_keys
    assert_equal(['key', 'key1'], print_all_keys([['key', 'value',], [ 'key1', 'value1']]))
  end

  def test_print_all_values
    assert_equal(['value', 'value1'], print_all_values([['key', 'value',], [ 'key1', 'value1']]))
  end
end
