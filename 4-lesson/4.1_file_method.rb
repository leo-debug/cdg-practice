@file = '4-homework.txt'

#выводит все строки
def index
  File.read(@file).split("\n")
end
  
#находит конкретную строку в файле и выводит ее
def find(id)
  file_data = File.open(@file).readlines.map { |line| line.chomp }
  file_data.fetch(id-1)
end

#находит все строки, где есть указанный паттерн
def where(pattern)
  arr_match_pattern = []

  File.open(@file).each_line do |line|
    arr_match_pattern << line if line.include?(pattern)
  end
  arr_match_pattern
end

#обновляет конкретную строку файла
def update(id, text)
  File.new('buffer.txt', 'w') if !File.exist?('buffer.txt')
  @buffer = 'buffer.txt'
  
  file = File.open(@buffer, 'w')
  File.foreach(@file).with_index do |old_string, index|
    file.puts(id == index+1 ? text : old_string)
  end
  file.close

  File.write(@file, File.read(@buffer))

  File.delete(@buffer) if File.exist?(@buffer)

  File.read(@file).split("\n")
end

#удаляет строку
def delete(id)
  File.new('buffer.txt', 'w') if !File.exist?('buffer.txt')
  @buffer = 'buffer.txt'

  def index
    File.foreach(@file) { |string| puts string }
  end



  file = File.open(@buffer, 'w')
  File.foreach(@file).with_index do |old_string, index|
    file.puts(id == index+1 ? next : old_string)
  end
  
  file.close
  File.write(@file, File.read(@buffer))

  File.delete(@buffer) if File.exist?(@buffer)

  File.read(@file).split("\n")
end

#добавляет строку в конец файла
def create(string)
  File.write(@file, string, mode: 'a')
end

def file_method

  #puts "проверка метода index"
  #puts "_____________________"
  #puts index
  #puts "_____________________"

  #puts "проверка метода find"
  #puts "_____________________"
  #puts find(3)
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
  #puts delete(1)
  #puts "_____________________"

  #puts "проверка метода create"
  #puts "_____________________"
  #puts create('Новая строка в конце файла')
  #puts "_____________________"

end

file_method


