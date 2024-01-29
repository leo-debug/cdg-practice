# frozen_string_literal: true

RSpec.describe 'file_method' do
  let(:test_file) { '4-homework.txt' }
  let(:buffer_file) { 'buffer.txt' }

  before do
    # Временный файл с тест данными перед каждым тестом
    File.write(test_file, "First line\nSecond line\nThird line\n")
  end

  after do
    # Удаляем временный файл после каждого теста
    File.delete(test_file) if File.exist?(test_file)
    File.delete(buffer_file) if File.exist?(buffer_file)
  end

  describe 'тест index' do
    it 'возвращает все строки' do
      expect(index).to eq("First line\nSecond line\nThird line\n")
    end
  end

  describe 'тест find' do
    it 'find(1) возвращает конкретную строку в файле по номеру строки' do
      expect(find(1)).to eq('First line')
    end

    it 'find(2) возвращает конкретную строку в файле по номеру строки' do
      expect(find(2)).to eq('Second line')
    end
    it 'find(3) возвращает конкретную строку в файле по номеру строки' do
      expect(find(3)).to eq('Third line')
    end
  end

  describe 'where' do
    it 'ввод части слова, возврат всех совпадений, где есть указанный паттерн' do
      expect(where('ir')).to eq(['First line', 'Third line'])
    end

    it 'ввод символа' do
      expect(where('1')).to eq([])
    end

    it 'ввод пробела' do
      expect(where(' ')).to eq(['First line', 'Second line', 'Third line'])
    end

    it 'вызов без аргумента возвращает ошибку ArgumentError' do
      expect { where }.to raise_error(ArgumentError)
    end
  end

  describe 'update' do
    it 'тест метода update, возвращает все строки с обновлением найденой' do
      update(2, 'Update Second line')
      expect(File.readlines(test_file)).to eq(["First line\n", "Update Second line\n", "Third line\n"])
    end
  end

  describe 'delete' do
    it 'тест метода delete' do
      delete(3)
      expect(File.readlines(test_file)).to eq(["First line\n", "Second line\n"])
    end
  end

  describe 'create' do
    it 'тест метода create' do
      create('New Line')
      expect(File.readlines(test_file)).to eq(["First line\n", "Second line\n", "Third line\n", "New Line\n"])
    end
  end
end
