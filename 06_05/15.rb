require 'minitest/autorun'

def year_is_leap?(year)
  if (year % 400 == 0) || ((year % 4 == 0) && (year % 100 != 0))
    true
  else
    false
  end
end

class Test < Minitest::Test
  def test_year_is_a_leap_and_century
    year = 2100
    assert_equal(false, year_is_leap?(year))
  end

  def test_year_is_a_leap_and_not_century
    year = 2096
    assert_equal(true, year_is_leap?(year))
  end

  def test_year_is_a_not_leap
    year = 1999
    assert_equal(false, year_is_leap?(year))
  end
end
