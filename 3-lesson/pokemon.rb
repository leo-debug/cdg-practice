#метод возвращающий массив с покемонами в формате [{ name: ‘Pikachu’, color: ‘Yellow’ }… n times{}]
def add_pokemon()
    pokemon_arr = []

    # очистка строки ввода количества покемонов от недопустимых символов/букв, кроме цифр
    def int_line_cleaning (num)
        num = num.tr('^0-9', '').to_i
    end
    
    puts 'Сколько добавить покемонов?'
    num = int_line_cleaning(gets)
    
    
    num.times do |i|
    
        puts "Введите имя #{i+1} покемона"
        pokemon_name = gets.to_s.strip
        
        puts "Введите цвет #{i+1} покемона"
        pokemon_color = gets.to_s.strip
        

        pokemon_arr << {
            name: pokemon_name,
            color: pokemon_color
        }
        
    end
    pokemon_arr
end

puts add_pokemon()