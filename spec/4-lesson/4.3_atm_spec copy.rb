# frozen_string_literal: true

RSpec.describe 'atm' do
  before do
    allow_any_instance_of(Object).to receive(:puts)
  end

  let(:user_balance) { 100.0 }

  describe 'тест депозита' do
      before do
        allow_any_instance_of(Object).to receive(:gets).and_return("d")
      end  
      it 'добавляет введенную сумму к балансу' do
        allow($stdin).to receive(:gets).and_return("d\n", "151\n")
      expect { atm }.to output("Баланс карты: 251.0\n").to_stdout
      end
  
      it 'сообщение об ошибке, если введен не положительный депозит' do
        allow_any_instance_of(Object).to receive(:gets).and_return("d\n", "-50\n", "q\n")
        expect { atm }.to output(/Число должно быть положительным/).to_stdout
      end
    end
  
    describe 'снятие средств' do
      it 'вычитает запрошеную сумму с баланса' do
        allow_any_instance_of(Object).to receive(:gets).and_return("w\n", "50\n", "q\n")
        expect { atm }.to output(/Баланс карты: -50.0/).to_stdout
      end
  
      it 'сообщение об ошибке, если в запросе отрицательное число' do
        allow_any_instance_of(Object).to receive(:gets).and_return("w\n", "-50\n", "q\n")
        expect { atm }.to output(/Вы ввели отрицательное число/).to_stdout
      end
  
      it 'сообщение об ошибке,если к снятию запрошено больше, чем есть на балансе' do
        allow_any_instance_of(Object).to receive(:gets).and_return("w\n", "200\n", "q\n")
        expect { atm }.to output(/К снятию запрошено больше, чем есть на балансе карты/).to_stdout
      end
    end
  
    describe 'баланс' do
      before do
        allow_any_instance_of(Object).to receive(:gets).and_return("d")
      end 
      it 'выводит баланс карты' do
        allow_any_instance_of(Object).to receive(:gets).and_return("b\n", "q\n")
        expect { atm }.to output(/Баланс карты: #{user_balance}/).to_stdout
      end
    end
  
    describe 'выход из цикла' do
      it 'exits the program' do
        allow_any_instance_of(Object).to receive(:gets).and_return("q\n")
        expect { atm }.to raise_error(SystemExit)
      end
    end
  
    describe 'сообщение об ошибке, если ввели не валидный символ' do
      it 'prints an error message for invalid operation' do
        allow_any_instance_of(Object).to receive(:gets).and_return("x\n", "q\n")
        expect { atm }.to output(/Введен неверный символ операции/).to_stdout
      end
    end
  end
