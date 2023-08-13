#@read_file - где ищем, @results - куда пишем
def search_and_record(read_file, results)
  @read_file = read_file
  @results = results

  #массив для хранения оставшихся строк
  @check_remaining_rows = []

  if File.exist?(@read_file)
    
    @check_remaining_rows = File.open(@read_file, 'r').readlines do |line|
      @check_remaining_rows << line.chomp
    end
  else
    p 'Несуществует или не верно указан файл для чтения'
  end

  loop do
    break if @check_remaining_rows.empty?
    p '========Введите возраст студента========'
    age = gets.to_i

    # цикл завершается чтением @results
    if age == -1
      break

    elsif age > 0
      match_student = nil
      # перебираем массив для поиска совпадения по паттерну age
      @check_remaining_rows.each do |line|
        if line.include?(age.to_s)
          match_student = line
          break
        end
        
      end

      #первое совпадение записать в @results 
      if match_student
        File.write(@results, match_student, mode: 'a')
      end

      #записываем в индекс первое совпадение и удоляем строку из массива хранения строк
      index = @check_remaining_rows.find_index { |row| row.match(age.to_s) }
      @check_remaining_rows.delete_at(index) if index
      
    else
      p 'Введены неверные данные или запрос пустой!'
    end
  end

  if File.zero?(@results)
    p "Файл #{@results} пустой"
  end

  File.open(results, 'r') do |file|
    file.each_line do |line|
      p line
    end
  end
end

search_and_record('fio_age.txt', 'result.txt')