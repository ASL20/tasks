require 'minitest/autorun'

def calculator(a, b, operation)
  result =
    case operation
    when '+'
      a.to_f + b
    when '-'
      a.to_f - b
    when '*'
      a.to_f * b
    when '/'
      a.to_f / b
    else
      'Нет такой операции'
    end
  result
end


class Test < Minitest::Test
  def test_addition
    assert_equal(4, calculator(2, 2, '+'))
  end

  def test_subtraction
    assert_equal(0, calculator(2, 2, '-'))
  end

  def test_multiplication
    assert_equal(4, calculator(2, 2, '*'))
  end

  def test_division
    assert_equal(1, calculator(2, 2, '/'))
  end

  def test_division_by_zero
    assert_equal(Float::INFINITY, calculator(2, 0, '/'))
  end
end
