class Field

	attr_accessor	:field, :count

	def initialize
		@field 			= field
		@count 			= count
		create_field
	end

	def create_field	
		puts "Введите желаемое количество строк/столбцов для игрового поля:"
		count = gets.chomp.to_i
		@field = Array.new(count){Array.new(count)}
	end
end
