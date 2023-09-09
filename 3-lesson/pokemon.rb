# frozen_string_literal: true

# метод возвращающий массив с покемонами в формате [{ name: ‘Pikachu’, color: ‘Yellow’ }… n times{}]

# основной метод
def add_pokemon
  pokemon_array = []
  add_num_pokemon.times do |num|
    pokemon_hash = write_pokemon_hash(num + 1)
    pokemon_array << pokemon_hash
  end
  puts pokemon_array.inspect
end

# вспомогательный метод добавления количества покемонов
def add_num_pokemon
  puts 'Сколько покемонов добавить?'
  int_line_cleaning(gets)
end

# вспомогательный метод записи покемонов в хеш
def write_pokemon_hash(num)
  puts "Введите имя #{num} покемона:"
  name = gets.chomp
  puts "Введите цвет #{num} покемона:"
  color = gets.chomp
  { name: name, color: color }
end

# вспомогательный метод очистки строки  от недопустимых символов/букв, кроме цифр
def int_line_cleaning(num)
  num.tr('^0-9', '').to_i
end

add_pokemon
