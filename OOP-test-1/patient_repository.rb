require 'csv'
require_relative './patient.rb'

class PatientRepository

  def initialize(csv_file)
    @csv_file = csv_file
    @patients = []
    @next_id = 0
    load_csv
  end

  def add(patient)
    patient.id = @next_id
    @patients << patient
    @next_id += 1
  end

  private

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      row[:cured] = row[:cured] == 'true'
      patient = Patient.new(row)
      @patients << patient
    end
    @next_id = @patients.empty? ? 1 : @patients.last.id + 1

  end
end

repo = PatientRepository.new('./patients.csv')
p repo

lucas = Patient.new(name: 'Lucas')

repo.add(lucas)

p repo

gabriel = Patient.new(name: 'Gabriel')

repo.add(gabriel)

p repo
