# frozen_string_literal: true

def foobar
  puts 'Введите первое число:'
  num1 = gets.to_i
  puts 'Введите второе число:'
  num2 = gets.to_i
  if num1 == 20 || num2 == 20
    puts num2
  else
    puts num1 + num2
  end
end
