# frozen_string_literal: true

# очистка объекта string принимаемого значения от недопустимых символов, цифр
def line_cleaning(string)
  string.tr('^A-Za-z', '')
end

# возведение в степень от длины слова
def exponentiation(string)
  2**string.length
end

def print_cs(word)
  # введенное слово оканчивается на 'CS' в любом регистре?
  if word.end_with?('CS', 'cs', 'Cs', 'cS')
    # возводит в степень
    puts exponentiation(word)
  else
    # выводит слово задом наперед
    puts line_cleaning(word).reverse
  end
end

# puts 'Введите слово:'
# word = line_cleaning(gets.chomp)
# print_cs(word)
