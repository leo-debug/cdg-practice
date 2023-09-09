RSpec.describe 'проверка метода sum' do
  it 'возвращает сумму двух чисел' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('2', '3')

    expect(sum).to eq("сумма чисел равна: 5")
  end
end
