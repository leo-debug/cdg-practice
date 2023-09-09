# frozen_string_literal: true

describe '# search_and_record' do
  let(:read_file_path) { 'test_input.txt' }
  let(:results_path) { 'test_result.txt' }

  before(:each) do
    # Создаем тестовый файл для чтения
    File.open(read_file_path, 'w') do |file|
      file.puts 'Беляков Серафим 20'
      file.puts 'Рябов Ярослав 26'
      file.puts 'Кириллова Дарья 18'
    end
  end

  before(:each) do
    # Очищаем файл результатов перед каждым тестом
    File.open(results_path, 'w') do |file|
      # Оставляем файл пустым
    end
  end

  it 'выводит содержимое файла result после ввода последовательности чисел' do
    # Подменяем ввод пользователя для ввода последовательности чисел
    allow_any_instance_of(Object).to receive(:gets).and_return("20\n", "18\n", "-1\n")

    # Вызываем метод search_and_record
    search_and_record(read_file_path, results_path)

    # Читаем содержимое файла результатов
    result_output = File.read(results_path)

    # Проверяем, содержит ли результат ожидаемые записи
    expect(result_output).to include("Беляков Серафим 20\n")
    expect(result_output).to include("Кириллова Дарья 18\n")
    expect(result_output).not_to include("Рябов Ярослав 26\n")
  end

  it 'распечатывает result, если его содержимое = read_file' do
    # Подменяем ввод пользователя для ввода последовательности чисел
    allow_any_instance_of(Object).to receive(:gets).and_return("20\n", "26\n", "18\n")

    # Читаем содержимое файла read_file.txt и создаем ожидаемый список записей
    expected_records = File.read(results_path).split("\n")

    # Вызываем метод search_and_record
    search_and_record(read_file_path, results_path)

    # Читаем содержимое файла results.txt и разделяем его на отдельные записи
    result_output = File.read(results_path).split("\n")

    # Проверяем, что все записи из ожидаемого списка присутствуют в файле результатов
    expected_records.each do |record|
      expect(result_output).to include(record)
    end
  end

  it 'не включает записи в result, если они не соответствуют условию' do
    # Подменяем ввод пользователя для ввода последовательности чисел
    allow_any_instance_of(Object).to receive(:gets).and_return("20\n", "26\n", "18\n")

    # Вызываем метод search_and_record
    search_and_record(read_file_path, results_path)

    # Проверяем, что ожидаемые записи отсутствуют в файле результатов
    expect(File.read(results_path)).not_to include("Рябов Ярослав 26\n")
  end

  # Удаляем тестовые файлы после выполнения всех тестов
  after(:all) do
    File.delete(read_file_path) if File.exist?(read_file_path)
    File.delete(results_path) if File.exist?(results_path)
  end
end
