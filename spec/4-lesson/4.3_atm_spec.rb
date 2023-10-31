# frozen_string_literal: true

RSpec.describe 'atm' do
  let(:start_user_balance) { 100.0 } # константа стартового баланса
  let(:puts_indent) { double("puts *") } # отступ после каждого вывода
  let(:greetings_mock) do # приветственная фраза/навигация
    <<~OUTPUT
    ****************************************************************
                           Не плачь, валюту прячь.                     
                           Снимай рубли, домой иди!                    
       
       ----------------Введите символ операции с картой-----------------
       ****************************************************************
       *Внести деньги - D                        Проверить баланс - B *
       *Снятие средств - W                     Выход из программы - Q *
       ****************************************************************
       *"
       *"
       *"
       ----------------Введите символ операции с картой-----------------
       ****************************************************************
       *Внести деньги - D                        Проверить баланс - B *
       *Снятие средств - W                     Выход из программы - Q *
       ****************************************************************
    OUTPUT
  end

  describe 'баланс' do
    before do
      allow_any_instance_of(Object).to receive(:gets).and_return('d')
    end 
    it 'выводит стартовый баланс карты, если файл с балансом не существует' do
      allow(File).to receive(:exist?).with('balance.txt').and_return(false)
      allow_any_instance_of(Object).to receive(:gets).and_return("b\n", "q\n")
      expect { atm }.to output(greetings_mock).to_stdout
      expect { atm }.to output("Баланс карты: #{START_USER_BALANCE}").to_stdout
    end

    it 'выводит баланс карты при чтении файла' do
      allow(File).to receive(:exist?).with('balance.txt').and_return(true)
      allow(File).to receive(:read).with('balance.txt').and_return('552.34')
      allow_any_instance_of(Object).to receive(:gets).and_return("b\n", "q\n")
      expect { atm }.to output('Баланс карты: 552.34').to_stdout
    end
  end
end
