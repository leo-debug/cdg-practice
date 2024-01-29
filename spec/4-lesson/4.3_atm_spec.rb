# frozen_string_literal: true

RSpec.describe 'atm' do
  let(:start_user_balance) { 100.0 } # константа стартового баланса

  let(:greetings) do # приветственная фраза/навигация
    <<~OUTPUT
    *****************************************************************
                        Не плачь, валюту прячь.                     
                        Снимай рубли, домой иди!                    
    OUTPUT
  end

  let(:navigation) do # печать запроса ввода символа операции
    <<~OUTPUT
    ----------------Введите символ операции с картой----------------
    ****************************************************************
    *Внести депозит - D                       Проверить баланс - B *
    *Снятие средств - W                     Выход из программы - Q *
    ****************************************************************                
    OUTPUT
  end

  let(:deposit_prompt) do # запрос на пополнение депозита
    <<~OUTPUT

         ----------------Введите сумму пополнения депозита---------------
      
    OUTPUT
  end

  let(:deposit_writing) do # запрос на списание депозита
    <<~OUTPUT

    ----------------------Укажите сумму к снятию---------------------
 
    OUTPUT
  end

  describe 'баланс' do
    it 'выводит стартовый баланс карты, если файл с балансом не существует' do
      allow(File).to receive(:exist?).with('balance.txt').and_return(false)

      allow_any_instance_of(Object).to receive(:gets).and_return("b\n", "q\n")

      expected_output = 
      #{greetings}
      #{navigation}
      <<~OUTPUT
        Баланс карты: #{start_user_balance}
      OUTPUT

      expect { atm }.to output(a_string_including(expected_output)).to_stdout
    end

    it 'выводит баланс карты при чтении файла' do
      allow(File).to receive(:exist?).with('balance.txt').and_return(true)
      allow(File).to receive(:read).with('balance.txt').and_return('552.34')

      allow_any_instance_of(Object).to receive(:gets).and_return("b\n", "q\n")

      expected_output = 
      #{greetings}
      #{navigation}
      <<~OUTPUT
        Баланс карты: 552.34
      OUTPUT

      expect { atm }.to output(a_string_including(expected_output)).to_stdout
    end
  end

  describe 'внесение депозита' do
    it 'пополнение депозита' do
      allow(File).to receive(:exist?).with('balance.txt').and_return(false)

      allow_any_instance_of(Object).to receive(:gets).and_return("d\n", "155.5\n", "q\n")

      expected_output = 
        #{greetings}
        #{navigation}
        #{deposit_prompt}
        <<~OUTPUT
          Баланс карты: 255.5
        OUTPUT

      expect { atm }.to output(a_string_including(expected_output)).to_stdout
    end

    it 'ошибка - число должно быть положительным' do
      allow(File).to receive(:exist?).with('balance.txt').and_return(false)

      allow_any_instance_of(Object).to receive(:gets).and_return("d\n", "-1010\n", "q\n")

      expected_output = 
        #{greetings}
        #{navigation}
        #{deposit_prompt}
        <<~OUTPUT

        ----------------Число должно быть положительным!-----------------
     
        OUTPUT

      expect { atm }.to output(a_string_including(expected_output)).to_stdout
    end
  end

  describe 'списание депозита' do
    it 'депозит можно списать' do
      allow(File).to receive(:exist?).with('balance.txt').and_return(false)

      allow_any_instance_of(Object).to receive(:gets).and_return("w\n", "11.5\n", "q\n")

      expected_output = 
        #{greetings}
        #{navigation}
        #{deposit_writing}
        <<~OUTPUT
          Баланс карты: 88.5
        OUTPUT

      expect { atm }.to output(a_string_including('Баланс карты: 88.5')).to_stdout
    end

    it 'ошибка - ввели отрицательное число' do
      allow(File).to receive(:exist?).with('balance.txt').and_return(false)

      allow_any_instance_of(Object).to receive(:gets).and_return("w\n", "-11.5\n", "q\n")

      expected_output = 
        #{greetings}
        #{navigation}
        #{deposit_writing}
        <<~OUTPUT

        ------------------Вы ввели отрицательное число!------------------
     
        OUTPUT

      expect { atm }.to output(a_string_including(expected_output)).to_stdout
    end

    it 'ошибка - запрошено больше, чем есть на балансе' do
      allow(File).to receive(:exist?).with('balance.txt').and_return(false)

      allow_any_instance_of(Object).to receive(:gets).and_return("w\n", "5000\n", "q\n")

      expected_output = 
        #{greetings}
        #{navigation}
        #{deposit_prompt}
        <<~OUTPUT

        ------К снятию запрошено больше, чем есть на балансе карты!------
     
        OUTPUT

      expect { atm }.to output(a_string_including(expected_output)).to_stdout
    end
  end

  describe 'частные случаи' do
    it 'ошибка - введен не верный символ операции' do
      allow(File).to receive(:exist?).with('balance.txt').and_return(false)

      allow_any_instance_of(Object).to receive(:gets).and_return("1wg324h\n", "!@ФaF#\n", "!]>,\n", "q\n")

      expected_output = 
        #{greetings}
        #{navigation}

        <<~OUTPUT

        ----------------Введен неверный символ операции!-----------------
     
        OUTPUT

      expect { atm }.to output(a_string_including(expected_output)).to_stdout
    end

    it 'завершение работы atm, выход из цикла и запись баланса пользователя в файл' do
      allow(File).to receive(:exist?).with('balance.txt').and_return(true)
      allow(File).to receive(:read).with('balance.txt').and_return('200.55')

      allow(File).to receive(:open).with('balance.txt', 'w').and_yield(mock_file = double)

      expect(mock_file).to receive(:write).with(301.05)

      allow_any_instance_of(Object).to receive(:gets).and_return("d\n", "100.50\n", "q\n")

      expected_output = 
      #{greetings}
      #{navigation}
      #{deposit_prompt}
      'До новых, волнующих, встреч!'

      expect { atm }.to output(a_string_including(expected_output)).to_stdout

    end
  end
end
