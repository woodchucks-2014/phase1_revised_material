class School
	attr_accessor :students
	def initialize
		self.students = []
		@student_names = ["Vivek", "Sandip", "Matt"]
		file = File.open('students.csv')
		file.each_line do |row|
			row_array = row.split(',')
			@student_names << row_array[1]
		end
		@student_names.map { |name| self.students << Student.new(name)}
	end
end

class Student
	attr_accessor :name
	def initialize(name)
		self.name = name
	end
end

DBC = School.new
# p DBC
DBC.students.each do |student|
	p student.name
end
