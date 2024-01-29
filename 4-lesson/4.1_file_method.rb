# frozen_string_literal: true

ORIGINAL_FILE = '4-homework.txt'
BUFFER = 'buffer.txt'

# выводит все строки
def index
  File.read(ORIGINAL_FILE) { |string| puts string }
end

# находит конкретную строку в файле по id и выводит ее
def find(line_number)
  file_data = File.open(ORIGINAL_FILE).readlines.map(&:chomp)
  index = line_number - 1
  file_data[index] if index >= 0 && index < file_data.size
end

# находит все строки, где есть указанный паттерн
def where(pattern)
  arr_match_pattern = []

  File.open(ORIGINAL_FILE).each_line do |line|
    arr_match_pattern << line.chomp if line.include?(pattern)
  end
  arr_match_pattern
end

# обновляет конкретную строку файла
def update(id, text)
  File.new('buffer.txt', 'w') unless File.exist?('buffer.txt')

  file = File.open(BUFFER, 'w')
  File.foreach(ORIGINAL_FILE).with_index do |old_string, index|
    file.puts(id == index + 1 ? text : old_string)
  end
  file.close

  File.write(ORIGINAL_FILE, File.read(BUFFER))

  File.delete(BUFFER)

  File.read(ORIGINAL_FILE).chomp
end

# удаляет строку
def delete(id)
  File.new('buffer.txt', 'w') unless File.exist?('buffer.txt')

  file = File.open(BUFFER, 'w')
  lines = File.foreach(ORIGINAL_FILE).with_index.filter_map do |old_string, index|
    id == index + 1 ? nil : old_string.chomp
  end

  file.puts(lines)
  file.close
  File.write(ORIGINAL_FILE, File.read(BUFFER))

  File.delete(BUFFER)

  File.read(ORIGINAL_FILE).chomp
end

# добавляет строку в конец файла
def create(string)
  File.write(ORIGINAL_FILE, "#{string}\n", mode: 'a')
end

def file_method
  #puts "проверка метода index"
  #puts "_____________________"
  #puts index
  #puts "_____________________"

  #puts "проверка метода find"
  #puts "_____________________"
  #puts find(5)
  #puts "_____________________"
  
  #puts "проверка метода where"
  #puts "_____________________"
  #puts where('строк')
  #puts "_____________________"

  #puts "проверка метода update"
  #puts "_____________________"
  #puts update(6, 'ЭТА СТРОКА ОБНОВЛЕНА')
  #puts "_____________________"

  #puts "проверка метода delete"
  #puts "_____________________"
  #puts delete(3)
  #puts "_____________________"

  #puts "проверка метода create"
  #puts "_____________________"
  #puts create('Новая строка в конце файла')
  #puts "_____________________"
end

