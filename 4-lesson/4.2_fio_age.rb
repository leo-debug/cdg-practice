# frozen_string_literal: true

# @read_file - где ищем, @results - куда пишем
def search_and_record(read_file, results)
  @read_file = read_file
  @results = results

  # массив для хранения оставшихся строк
  @check_remaining_rows = []

  if File.exist?(@read_file)
    @check_remaining_rows = File.readlines(@read_file).map(&:chomp)
  else
    p 'Несуществует или не верно указан файл для чтения'
    return
  end

  loop do
    break if @check_remaining_rows.empty?

    p '========Введите возраст студента========'
    age = gets.to_i

    # цикл завершается чтением @results
    if age == -1
      break
    elsif age.positive?
      match_student = nil
      # перебираем массив для поиска совпадения по паттерну age
      @check_remaining_rows.each do |line|
        if line.include?(age.to_s)
          match_student = line
          break
        end
      end

      # первое совпадение записать в @results
      File.write(@results, "#{match_student}\n", mode: 'a') if match_student

      # записываем в индекс первое совпадение и удаляем строку из массива хранения строк
      index = @check_remaining_rows.find_index { |row| row.match(age.to_s) }
      @check_remaining_rows.delete_at(index) if index
    else
      p 'Введены неверные данные или запрос пустой!'
    end
  end

  if File.empty?(@results) || !File.exist?(@results)
    p "Файл #{@results} пуст"
  else
    File.open(@results, 'r') do |file|
      file.each_line do |line|
        p line.chomp
      end
    end
  end
end

search_and_record('fio_age.txt', 'result.txt')
