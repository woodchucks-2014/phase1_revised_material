require 'CSV'

data_array = []

CSV.foreach('students.csv') do |row|
  data_array << row
end

student_names = data_array.map{|column| column[1] if column[1] !="first_name"}
student_names.delete(nil)

new_names = ["Vivek", "Mike", "Chris"]
new_names.each{|name| student_names.push(name)}
p student_names






























