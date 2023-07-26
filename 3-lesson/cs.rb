# очистка объекта string принимаемого значения от недопустимых символов, цифр
def line_cleaning (string)
    string = string.tr('^A-Za-z', '')

    #return string
end

#возведение в степень от длины слова
def exponentiation (string)
    2 ** string.length
end


puts "Введите слово:"

word = line_cleaning(gets.to_s);

#введенное слово оканчивается на 'CS' в любом регистре?
if word.end_with?('CS', 'cs','Cs', 'cS')
    #возводит в степень
    puts exponentiation(word)
else
    #выводит слово задом наперед
    puts word.reverse
end

