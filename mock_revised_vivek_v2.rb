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
end
