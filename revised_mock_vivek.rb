# require 'CSV'

# data_array = []

# CSV.foreach('students.csv') do |row|
#   data_array << row

# end

# student_names = data_array.map{|column| column[1] if column[1] !="first_name"}
# student_names.delete(nil)

# new_names = ["Vivek", "Mike", "Chris"]
# new_names.each{|name| student_names.push(name)}
# p student_names

# def add_number
#   students_names.each_with_index do |name, index|
#     puts "#{(index +1)} " + name
#   end
# end

# add_number


require 'CSV'

class List
attr_accessor :data_array, :cohort

  def initialize(csv)
    @data_array = []
    File.open(csv, mode='a+'){|file| file.each_line{|line| @data_array << Students.new(line) }}
    @columns = @data_array.shift
    # @cohort = cohort || "NA" # NOT WORKING
    # p @column
    # p @data_array
    # p @data_array[2]
  end

  def student_ids
    ids = []
    @data_array.each{ |student| ids << student.id}
  end

  def first_names
    first_name = []
    @data_array.each{ |student| first_name << student.first_name}
    # p first_name
  end

  def name_sorter # NOT WORKING
    @data_array.sort_by!{ |student| student.first_name }
  end

  def name_beginning_with(*letters)
    names_with_letter = []
    letters.each{ |letter| @data_array.each{ |student| names_with_letter << student.first_name if student.first_name[0] == letter}}
    names_with_letter
  end

   def phone (*phones) # NOT WORKING
    @data_array.map!.with_index do |student, i|
      student.phone = phones[i % phones.length] if student.phone == "NA"
    end
  end

  def failing
    @failers = []
    @data_array.each{ |student| @failers << student if student.grade.to_i < 60 }
    @failers.each{|student| puts "#{student.first_name}" }
  end

  def write(csv, *item)
    File.open(csv,"w"){ |file| puts item.flatten}
  end

end

class Students
  def initialize(student_details)
    @student_details = student_details
    @student_details = @student_details.gsub!("\n","").split(",")
    # @student_info
  end

  def id
    @student_details[0]
  end

  def first_name
    @student_details[1]
  end

  def grade
    @student_details[5]
  end



end




# Controller
roster = List.new('students.csv')
# p roster
roster.first_names
# roster.name_sorter
# roster.name_beginning_with("R")
# roster.failing
# roster.write("newstudent.csv", roster.failing)
# p roster.phone("iOS,","Android", "Windows")



























