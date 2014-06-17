class School
	attr_accessor :new_student_list
	def initialize
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

	def display_by_cohort(cohort)
		@new_student_list.each do |student|
			if student.first[1] == cohort
				p student.first[0]
			end
		end
	end

	def failing
		@failing_students = []
		new_file = File.open('students.csv')
		new_file.each_line do |row|
			row_array = row.split(',')
			row_array[5].gsub!("\n","")
			new_row_array = row_array

			if new_row_array[5].to_i< 60
			@failing_students << new_row_array[1]
			end
		end
		p @failing_students
	end

end



class Student
	attr_accessor 
	def initialize
	
	end

	def add_cohort(school, cohort)
		school.new_student_list.map! do |name|
			{name => cohort.sample}
		end
		school.new_student_list
	end

	def add_phone(school, phone)
		school.new_student_list.map! do |name|
			{name => phone.sample}
		end
		p school.new_student_list
	end


end


# Driver code

##### Release 0
dbc = School.new
student = Student.new

##### Release 1
# dbc.add_number
# puts DBC.sort
# p DBC.by_letter("a")

##### Release 2
# completed

# Release 3
# cohort = ["wind", "earth", "fire" ]
# student.add_cohort(dbc, cohort)
# phone = ["iPhone", "Android", "Windows" ]
# student.add_phone(dbc, phone)
# dbc.display_by_cohort("wind")
dbc.failing

