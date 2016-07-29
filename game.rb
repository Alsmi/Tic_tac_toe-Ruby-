require './field'

class Game

	attr_accessor 	:cells_count
	attr_reader		:count, :field

	def initialize field_new
		@field = field_new.field
		@count = field_new.field.count
		@cells_count = field_new.field.count**2
	end

	def play
		field_show
		cells_count.times do |i|
			if i%2 != 1
				move(1)
			else
				move(2)
			end
			field_show
			if check_horizontal != "-" || check_vertical != "-" || check_diagonal != "-"
				break
			end
		end
		show_rezult
	end

	def field_show
		puts "================"
		field.each do |item|
			item.each do |i|
				if i == nil
					print "| |"
				else
					print "|#{i}|"
				end
			end
			puts
		end
		puts "================"
	end

	def enter_coordinates
		puts "Введите координату х ="
		@curent_x = gets.chomp.to_i

		while @curent_x<1 || @curent_x>@count do
			puts "Ошибка!!! Введите корректные данные!"
			@curent_x = gets.chomp.to_i
		end

		puts "Введите координату Y ="
		@curent_y = gets.chomp.to_i

		while @curent_y<1 || @curent_y>@count do
			puts "Ошибка!!! Введите корректные данные!"
			@curent_y = gets.chomp.to_i
		end

	end

	def move(num)
		if num == 1
			puts "Ходит игрок - Х"
		else
			puts "Ходит игрок - 0"
		end

		enter_coordinates

		while @field[@curent_y-1][@curent_x-1]=="X" || @field[@curent_y-1][@curent_x-1]=="0" do
			puts "Поле занято!!! Выберите другое поле!"
			enter_coordinates
		end

		if num == 1
			@field[@curent_y-1][@curent_x-1]='X'
		else
			@field[@curent_y-1][@curent_x-1]='0'
		end
	end

	def check_uniq(arr)
		arr.each do |item|
			if item.uniq.size == 1
				if item.uniq[0] == 'X'
					return "X"
				elsif item.uniq[0] == '0'
					return "0"
				end
			end
		end
		return "-"
	end

	def check_horizontal
		check_uniq(@field)
	end

	def check_vertical
		trans_field = @field.transpose
		check_uniq(trans_field)
	end

	def check_diagonal
		diagonales = []
		first_diagonal = []
		second_diagonal = []
		n = 0
		k = @count-1
		@field.each do
			first_diagonal.push(@field[n][n])
			second_diagonal.push(@field[n][k])
			n += 1
			k += -1
		end
		diagonales.push(first_diagonal)
		diagonales.push(second_diagonal)
		check_uniq(diagonales)
	end

	def show_rezult
		if check_horizontal == 'X' || check_vertical == 'X' || check_diagonal == "X"
			puts "Победа!!! Победитель - Х"
		elsif check_horizontal == '0' || check_vertical == '0' || check_diagonal == "0"
			puts "Победа!!! Победитель - 0"
		else
			puts "Ничья!!!"
		end
	end
end