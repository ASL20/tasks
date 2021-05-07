string = "Halleluja"

def manual_reverse(word)
  first_letter = word[0]
  last_letter = word[-1]

  word[0] = last_letter
  word[-1] = first_letter

  word
end

puts manual_reverse(string)
