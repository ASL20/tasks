require 'minitest/autorun'

def phonebook(surname)
  array = [
    ['Иванов', 2432],
    ['Петров', 2401],
    ['Сидоров', 2402],
    ['Степанов', 2403],
    ['Митрофанов', 2405],
    ['Владимиров', 2406],
    ['Захаров', 2407],
    ['Епифанов', 2408],
    ['Михайлов', 2409],
    ['Ефремов', 2404]
  ]

  result =
  array.each do |n|
    return n[1] if n[0] == surname.capitalize
  end
  'Нет такого абонента'
end

class Test < Minitest::Test
  def test_phonebook_correct_work
    assert_equal(2432, phonebook('Иванов'))
  end

  def test_phonebook_wrong_surname
    assert_equal('Нет такого абонента', phonebook('Шамраев'))
  end
end
