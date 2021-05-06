puts 'Введите таймер до взрыва'
time = STDIN.gets.to_i

while time >= 0
  if time == 4
    puts 'Скоро рванет'
  elsif time == 0
    puts 'BOOM'
  else
    puts time
  end
  sleep 1
  time -= 1
end
