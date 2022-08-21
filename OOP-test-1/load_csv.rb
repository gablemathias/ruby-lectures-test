require 'csv'
require_relative './patient.rb'

patients = []

csv_file = "./patients.csv"

CSV.foreach(csv_file, headers: :first_row, header_converters: :symbol) do |row|
  row[:id] = row[:id].to_i ## convert to integer
  row[:cured] = row[:cured] == 'true' ## convert to boolean
  p row
  patients << Patient.new(row)
end

# patients.each { |patient| p patient.name }
# patients.each { |patient| p patient.cured }
