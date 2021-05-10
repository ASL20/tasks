require 'minitest/autorun'

def define_business(name, month, day)
  name_array =
    %w[ Изготовление Производство Дизайн Склад Разработка Создание Оптимизация Продажа Ремонт Завод Удвоение
      Магазин Плавление Строительство Настройка Монтаж Оформление Съемка Аутсорс Обучение Увеличение Продвижение
      Ведение Шитье Покраска Выпечка Вязание Печать ]

  month_array =
    ["инстаграм-аккаунтов", "компьютеров", "техники apple", "пледов с рукавами", "крабов", "соц. сетей",
      "лендингов", "интернет-магазинов", "щебня", "квадрокоптеров", "булочек", "банных веников"]

  day_array =
    ["оптом", "под ключ", "без предоплаты", "за результат", "с гарантией 100 лет", "от производителя", "со склада", "в Чебоксарах",
      "за 1 час", "по полной предоплате", "без смс", "онлайн", "без регистрации", "в розницу", "на 20% быстрее", "с бесплатной доставкой",
      "в Москве", "в Питере", "по всей России и СНГ", "за 2 месяца", "по всему миру", "с гарантией результата", "без гарантии",
      "без вложений", "в Ижевске", "по Казахстану", "в Украине", "бесплатно", "дорого", "по всему миру", "в Электростали"]

  name_indexes = %w[ а б в г д е ж з и к л м н о п р с т у ф х ц ч ш щ э ю я]

  name_index = nil

  counter = 0
  name_indexes.each do |name|
    name_index = counter if name.downcase == name
    break if name_index = counter
    counter += 1
  end
  "#{name_array[name_index]} #{month_array[month - 1]} #{day_array[day - 1]}"
end

class Test < Minitest::Test
  def test_define_business_correct_work
    assert_equal("Изготовление интернет-магазинов без предоплаты", define_business("А", 8, 3))
  end
  def test_define_business_wrong_input
    assert_raises(NoMethodError) { define_business(1, 1, 1) }
  end
end
