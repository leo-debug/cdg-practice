RSpec.describe 'тесты для line_cleaning' do
  it 'очищает строку от недопустимых символов и цифр' do
    expect(line_cleaning('ab123c&d')).to eq('abcd')
    expect(line_cleaning('12345@*^&@#$%^+_-?><')).to eq('')
    expect(line_cleaning('point!#$)_#^*&><?*')).to eq('point')
  end
end

RSpec.describe 'тесты для exponentiation' do
  it 'возвращает правильный результат возведения в степень' do
    expect(exponentiation('')).to eq(1)
    expect(exponentiation('amCS')).to eq(16)
  end
end

RSpec.describe 'тесты для print_cs' do
  it 'возводит в степень, если слово оканчивается на CS' do
    expect { print_cs('amCS') }.to output("16\n").to_stdout
    expect { print_cs('wordCs') }.to output("64\n").to_stdout
    expect { print_cs('hellocS') }.to output("128\n").to_stdout
    expect { print_cs('hellorkcs') }.to output("512\n").to_stdout
  end

  it 'печатает слово задом наперед' do
    expect { print_cs('Omsk12345@*^&@#$%^+_-?><') }.to output("ksmO\n").to_stdout
    expect { print_cs('wo12345@*^&@#$%^+_-?><rd') }.to output("drow\n").to_stdout
    expect { print_cs('he12345@*^&@#$%^llO+_-?><') }.to output("Olleh\n").to_stdout
  end
end
