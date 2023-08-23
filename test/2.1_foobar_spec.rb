# frozen_string_literal: true
RSpec.describe 'тест метода foobar' do
  it 'возвращает второе число, если второе равно 20' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("10\n", "20\n")
    expect { foobar }.to output("Введите первое число:\nВведите второе число:\n20\n").to_stdout
  end

  it 'возвращает второе число, если первое равно 20' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("20\n", "30\n")
    expect { foobar }.to output("Введите первое число:\nВведите второе число:\n30\n").to_stdout
  end

  it 'возвращает сумму чисел' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("10\n", "15\n")
    expect { foobar }.to output("Введите первое число:\nВведите второе число:\n25\n").to_stdout
  end
end
