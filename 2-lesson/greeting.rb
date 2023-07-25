# очистка строки ввода ФИО от недопустимых символов, цифр
# и перевод первого символа в верхний регистр
def fio_line_cleaning (string)
    string = string.tr('^A-Za-z', '').capitalize
end

# очистка строки ввода возраста от недопустимых символов/букв, кроме цифр
def age_line_cleaning (age)
    age = age.tr('^0-9', '').to_i
end

#преобразуем введенные данные в строку и передаем в метод очистки
puts "Введите ваше имя:"
first_name = fio_line_cleaning(gets.to_s)

puts "Введите вашу фамилию:"
last_name = fio_line_cleaning(gets.to_s)

#преобразуем введенные данные в строку и передаем в метод очистки
puts "Склько тебе лет?"
age = age_line_cleaning(gets.to_s)


if age>=18
    puts "Привет, #{first_name} #{last_name}. Самое время заняться делом!"
else
    puts "Привет, #{first_name} #{last_name}. Тебе меньше 18 лет, но начать учиться программировать никогда не рано"
end

