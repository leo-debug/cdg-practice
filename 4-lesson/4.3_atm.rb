# frozen_string_literal: true

START_USER_BALANCE = 100.0

def atm
  if File.exist?('balance.txt')
    user_balance = File.read('balance.txt').to_f
  else
    user_balance = START_USER_BALANCE
  end

  puts <<~TEXT
   ****************************************************************
                        Не плачь, валюту прячь.                     
                        Снимай рубли, домой иди!                    
  
  TEXT

  loop do
    puts <<~TEXT
    ----------------Введите символ операции с картой----------------
    ****************************************************************
    *Внести деньги - D                        Проверить баланс - B *
    *Снятие средств - W                     Выход из программы - Q *
    ****************************************************************
    TEXT

      user_query = gets.chomp.downcase if gets

    case user_query
    when 'd'
      puts <<~TEXT

         ----------------Введите сумму пополнения депозита---------------
      
      TEXT
      deposit = gets.chomp.to_f
      if deposit.positive?
        user_balance += deposit.round(1)
        puts <<~TEXT
           
        Баланс карты: #{user_balance}
        
        TEXT
      else
        puts <<~TEXT

           ----------------Число должно быть положительным!-----------------
        
        TEXT
      end
    when 'w'
      puts <<~TEXT

         ----------------------Укажите сумму к снятию---------------------
      
      TEXT
      withdraw = gets.chomp.to_f
      if withdraw.positive? && withdraw <= user_balance
        user_balance -= withdraw.round(1)
        puts <<~TEXT

           Баланс карты: #{user_balance}
        
        TEXT
      elsif withdraw.negative?
        puts <<~TEXT

           ------------------Вы ввели отрицательное число!------------------
        
        TEXT
      elsif withdraw > user_balance
        puts <<~TEXT

           ------К снятию запрошено больше, чем есть на балансе карты!------
        
        TEXT
      else
        break
      end
    when 'b'
      puts <<~TEXT

         Баланс карты: #{user_balance}
      
      TEXT
      next
    when 'q'
      break
    else
      puts <<~TEXT

         ----------------Введен неверный символ операции!-----------------
      
      TEXT
      next
    end
  end
  File.open('balance.txt', 'w') { |file| file.write(user_balance) }
end
