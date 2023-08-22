# frozen_string_literal: true

RSpec.describe 'pokemon' do
  before do
    allow($stdout).to receive(:puts).and_call_original
    allow_any_instance_of(Kernel).to receive(:gets).and_return("2\n", "Pikachu\nYellow\n", "Charizard\nOrange\n")
  end

  describe 'тест основного метода add_pokemon' do
    it 'должен распечатать хеш с покемонами' do
        expected_result = "Сколько покемонов добавить?\nВведите имя 1 покемона:\nВведите цвет 1 покемона:\nВведите имя 2 покемона:\nВведите цвет 2 покемона:\n[{:name=>\"Pikachu\\nYellow\", :color=>\"Charizard\\nOrange\"}, {:name=>\"Charizard\\nOrange\", :color=>\"Charizard\\nOrange\"}]\n"

        expect { add_pokemon }.to output(expected_result).to_stdout
    end
  end

  describe 'тест вспом метода write_pokemon_hash' do
    it 'должен записать покемона в хеш' do
      num = 1

      allow_any_instance_of(Kernel).to receive(:gets).and_return("Pikachu\n", "Yellow\n")
      pokemon_hash = write_pokemon_hash(num)

      expect(pokemon_hash[:name]).to eq("Pikachu")
      expect(pokemon_hash[:color]).to eq("Yellow")
    end
  end

  describe 'тест вспом метода очистки строки' do
    it 'должен вернуть число записываемых покемонов' do
      expect(add_num_pokemon).to eq(2)
    end
  end
end
