# очистка строки ввода ФИО от недопустимых символов
# и перевод первого символа в верхний регистр
def fio_line_cleaning string
    string = gets.gsub(/[^A-Za-z]/, '').capitalize

    #return string
end

puts "Введите ваше имя:"
#first_name = fio_line_cleaning(gets.to_s)

first_name = gets.to_s.chop
#first_name = fio_line_cleaning(first_name)



puts "Введите вашу фамилию:"
last_name = gets.to_s.chop
#last_name = fio_line_cleaning(gets)

puts "Склько тебе лет?"
age = gets.to_i

if age>=18
    puts "Привет, #{first_name} #{last_name}. Самое время заняться делом!"
else
    puts "Привет, #{first_name} #{last_name}. Тебе меньше 18 лет, но начать учиться программировать никогда не рано"
end

