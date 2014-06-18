require "csv"

module Utils
  def self.hashes_from_csv(file)
    rows = CSV.read(file, { headers: true }) # Set headers true so we get back CSV::Row objects instead of Array objects
    rows.map {|row| self.symbolize_hash_keys(row.to_hash)}
  end

  # Taken from http://stackoverflow.com/questions/800122/best-way-to-convert-strings-to-symbols-in-hash
  def self.symbolize_hash_keys(hash)
    Hash[hash.map {|key, value| [key.to_sym, value]}]
  end
end

class Student
  ATTRIBUTES = %i(id first_name last_name email phone grade) # short hand to get array of keys similar to %w

  ATTRIBUTES.each do |attr|
    define_method(attr) { @data[attr] }
    define_method("#{attr}=") { |value| @data[attr] = value }
  end

  def initialize(args)
    @data = args
  end

  def to_s
    @data.values.join(", ")
  end

  def self.csv_headers
    ATTRIBUTES.map(&:to_s).join(",")
  end

  def to_csv
    @data.values.join(",")
  end
end

class School
  def initialize
    @students = []
  end

  def add_students(students)
    @students += students
  end

  def print_students_alphabetical
    @students.sort_by { |student| student.first_name }.each {|student| puts student}
  end

  # id is a sequential number...
  def print_students
    @students.each {|student| puts student}
  end

  def export_students_csv
    File.open("students-export.csv", "w") do |f|
      f.puts Student.csv_headers
      @students.each do |student|
        f.puts student.to_csv
      end
    end
  end
end


# Driver code
students = Utils.hashes_from_csv("students.csv").map { |hash| Student.new(hash) }
school = School.new
school.add_students(students)
school.print_students
school.print_students_alphabetical
school.export_students_csv
