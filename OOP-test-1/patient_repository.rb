require 'csv'
require_relative './patient.rb'
require_relative './room_repository.rb'

class PatientRepository

  attr_reader :patients, :room_repo

  def initialize(csv_file, room_repository)
    @csv_file = csv_file
    @room_repo = room_repository
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

      ## To do >> Add patient inside the room
      p @room_repo.find(row[:room_id].to_i)
      # p row[:room_id].to_i
      # p room
      # patient.room = room
      @patients << patient
    end
    @next_id = @patients.empty? ? 1 : @patients.last.id + 1

  end
end

room_repo = RoomRepository.new('./room.csv')
p room_repo
repo = PatientRepository.new('./patients.csv', room_repo)
p repo.patients.first

# lucas = Patient.new(name: 'Lucas')
# repo.add(lucas)
# gabriel = Patient.new(name: 'Gabriel')
# repo.add(gabriel)
