RSpec.describe 'тест вспомогательных методов' do
  it 'очищает строку от недопустимых символов и цифр' do
    expect(fio_line_cleaning('Ab123c&D')).to eq('Abcd')
    expect(fio_line_cleaning('12345@*^&@#$%^+_-?><')).to eq('')
    expect(fio_line_cleaning('poInt!#$)_#^*&><?*')).to eq('Point')
  end

  it 'очищает строку от недопустимых символов' do
    expect(age_line_cleaning('ab123c&d')).to eq(123)
    expect(age_line_cleaning('12345@*^&@#$%^+_-?><')).to eq(12_345)
  end
end

RSpec.describe 'Приветствие пользователя' do
  before do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('Pontii', 'Pilat', 30)
  end

  context 'Если возраст >= 18' do
    it 'Приветствие для пользователя старше 17 лет' do
      expect { greeting }.to output("Введите ваше имя:\nВведите вашу фамилию:\nСколько тебе лет?\nПривет, Pontii Pilat. Самое время заняться делом!\n"
      ).to_stdout
    end
  end

  context 'Если возраст < 18' do
    before do
        allow_any_instance_of(Kernel).to receive(:gets).and_return('Pontii', 'Pilat', 15)
      end
    it 'Приветствие для пользователя младше 18 лет' do
      expect { greeting }.to output("Введите ваше имя:\nВведите вашу фамилию:\nСколько тебе лет?\nПривет, Pontii Pilat. Тебе меньше 18 лет, но начать учиться программировать никогда не рано\n"
      ).to_stdout
    end
  end
end
