# frozen_string_literal: true

RSpec.describe 'atm' do
  let(:start_user_balance) { 100.0 } # константа стартового баланса
  
  let(:greetings_mock) do # приветственная фраза/навигация
    puts <<~OUTPUT
    ****************************************************************
    Не плачь, валюту прячь.                     
    Снимай рубли, домой иди!                    

    OUTPUT
  end

  let(:request_mock) do # печать запроса ввода символа операции
    puts <<~OUTPUT
    ----------------Введите символ операции с картой----------------
    ****************************************************************
    *Внести деньги - D                        Проверить баланс - B *
    *Снятие средств - W                     Выход из программы - Q *
    ****************************************************************                
    OUTPUT
  end

  describe 'баланс' do
    
    it 'выводит стартовый баланс карты, если файл с балансом не существует' do
     allow(File).to receive(:exist?).with('balance.txt').and_return(false)
     #allow($stdin).to receive(:gets).and_return("b\n")
     allow_any_instance_of(Object).to receive(:gets).and_return("b\n", "q\n")
     expect { atm }.to output(
      "#{greetings_mock}\n
      #{request_mock}\n" +
       <<~OUTPUT

        Баланс карты: #{start_user_balance}
     
        OUTPUT
       ).to_stdout
    end

    #it 'выводит баланс карты при чтении файла' do
    #  allow(File).to receive(:exist?).with('balance.txt').and_return(true)
    #  allow(File).to receive(:read).with('balance.txt').and_return('552.34')
    #  allow_any_instance_of(Object).to receive(:gets).and_return("b\n", "q\n")
    #  expect { atm }.to output(greetings_mock).to_stdout
    #  expect { atm }.to output(
    #    <<~OUTPUT
#
    #     Баланс карты: 552.34
    #  
    #     OUTPUT
    #    ).to_stdout
    #end
  end
end
