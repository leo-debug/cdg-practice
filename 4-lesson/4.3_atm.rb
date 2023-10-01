# frozen_string_literal: true

START_USER_BALANCE = 100.0

def atm
  if File.exist?('balance.txt')
    user_balance = File.read('balance.txt').to_f
  else
    user_balance = START_USER_BALANCE
  end
  p '*'
  p '*'
  p "Баланс карты: #{user_balance}"
  p '*'
  p '*'
  p '****************************************************************'
  p '                    Не плачь, валюту прячь.                     '
  p '                    Снимай рубли, домой иди!                    '
  p ''

  loop do
    p '----------------Введите символ операции с картой-----------------'
    p '****************************************************************'
    p '*Внести деньги - D                        Проверить баланс - B *'
    p '*Снятие средств - W                     Выход из программы - Q *'
    p '****************************************************************'
    user_query = gets.chomp.downcase
    case user_query
    when 'd'
      p '----------------Введите сумму пополнения депозита----------------'
      p '*'
      p '*'
      deposit = gets.chomp.to_f
      if deposit.positive?
        user_balance += deposit.round(1)
        p "Баланс карты: #{user_balance}"
        p '*'
        p '*'
      else
        p '----------------Число должно быть положительным!-----------------'
        p '*'
        p '*'
      end
    when 'w'
      p '----------------------Укажите сумму к снятию---------------------'
      withdraw = gets.chomp.to_f
      if withdraw.positive? && withdraw <= user_balance
        user_balance -= withdraw.round(1)
        p "Баланс карты: #{user_balance}"
        p '*'
        p '*'
      elsif withdraw.negative?
        p '------------------Вы ввели отрицательное число!------------------'
        p '*'
        p '*'
      elsif withdraw > user_balance
        p '------К снятию запрошено больше, чем есть на балансе карты!------'
        p '*'
        p '*'
      else
        break
      end
    when 'b'
      p "Баланс карты: #{user_balance}"
      p '*'
      p '*'
      next
    when 'q'
      break
    else
      p '----------------Введен неверный символ операции!-----------------'
      next
    end
  end
  File.open('balance.txt', 'w') { |file| file.write(user_balance) }
end

atm
