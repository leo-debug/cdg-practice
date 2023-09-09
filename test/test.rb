# метод суммы двух чисел

def sum
  pp 'введите первое число'
  a = gets.chomp.to_i
  pp 'введите второе число'
  b = gets.chomp.to_i
  result = a + b
  pp "сумма чисел равна: #{result}"
end
