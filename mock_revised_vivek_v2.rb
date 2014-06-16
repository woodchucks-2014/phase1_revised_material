class School
	attr_accessor :students
	def initialize
		# self.students = []
		@student_names = []
		@new_students = ["Vivek", "Sandip", "Matt"]
		file = File.open('students.csv')
		file.each_line do |row|
			row_array = row.split(',')
			@student_names << row_array[1]
		end
		@student_names.shift
		@student_names
		@student_names << @new_students
		@new_student_list = @student_names.flatten
		# @student_names.map { |name| self.students << Student.new(name)}
	end


	def add_number
		@new_student_list.each_with_index do |name, index|
		puts "#{index + 1} #{name}"
		end
	end

	def sort
		@new_student_list.sort

	end

	def by_letter(letter)
		@sort_names = []
		# @new_student_list.select { |name| name[0] = letter }
		# p name[0]
		@new_student_list.each do |name|
		 if name[0].downcase == letter.downcase
		 		@sort_names << name
			end
		end
		@sort_names
	end

end



class Student
	attr_accessor :name
	def initialize(name)
		self.name = name
	end
end


# Driver code

##### Release 0
DBC = School.new


# #### Release 1
# DBC.add_number
# puts DBC.sort
# p DBC.by_letter("a")



