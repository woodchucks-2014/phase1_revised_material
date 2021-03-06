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
  def initialize(students: [], cohorts: [])
    @students = students
    @cohorts = {}
    cohorts.each do |cohort|
      @cohorts[cohort] = []
    end
  end

  def add_students(students)
    @students += students
  end

  def add_student_to_cohort(student, cohort)
    @cohorts[cohort] << student
  end

  # id is a sequential number...
  def print_students(students = @students)
    students.each {|student| puts student}
  end

  def print_students_alphabetical
    print_students @students.sort_by {|student| student.first_name}
  end

  def print_students_selected_by_first_name_first_letter(letter)
    print_students @students.select {|student| student.first_name.start_with? letter}
  end

  def print_students_by_cohort
    @cohorts.each do |cohort, students|
      puts "Cohort: #{cohort}"
      print_students students
    end
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
school = School.new(cohorts: [:cicadas, :woodchucks])
school.add_students(students)
school.print_students
school.print_students_alphabetical
school.print_students_selected_by_first_name_first_letter('M')
school.export_students_csv

school.add_student_to_cohort(Student.new(first_name: "Matthew", last_name: "Bunday"), :woodchucks)
school.add_student_to_cohort(Student.new(first_name: "Aleister", last_name: "Crowley"), :cicadas)
school.print_students_by_cohort
