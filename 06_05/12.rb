def middle_element(string)
  if string.length % 2 == 0
    string[string.length / 2 - 1]
  else
    string[string.length / 2]
  end
end
