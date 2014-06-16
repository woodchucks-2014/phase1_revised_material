class School
	attr_accessor :students
	def initialize
		# self.students = []
		@student_names = []
		@student_names = ["Vivek", "Sandip", "Matt"]
		file = File.open('students.csv')
		file.each_line do |row|
			row_array = row.split(',')
			@student_names << row_array[1]
		end
		@student_names.remove[3]
		@student_names
		# @student_names.map { |name| self.students << Student.new(name)}
	end


	def add_number
		@student_names.each_with_index do |name, index|
		puts "#{index + 1} #{name}"
		end
	end

	def sort
		@student_names.sort
	end

	def by_letter(letter)
		sort_names = []
		@student_names.each do |name|
			sort_names << if name[0] == letter
			end
		end
	end

end



class Student
	attr_accessor :name
	def initialize(name)
		self.name = name
	end
end

DBC = School.new
p DBC

# DBC.students.each do |student|
	# p student.name
# end

# DBC.add_number
# puts DBC.sort
# p DBC.by_letter("a")



