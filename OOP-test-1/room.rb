require_relative './patient'

class Room
  attr_reader :patients

  def initialize(attributes = {})
    @capacity = attributes[:capacity]
    @patients = attributes[:patients] || []
  end

  def add(patient)
    @patients << patient
  end

  # def full?
  #   @capacity ==
  # end
end

room = Room.new(capacity: 2)

p room

sarah = Patient.new(name: 'Sarah')
room.add(sarah)

john = Patient.new(name: 'John', cured: true)

room.add(john)

room.patients.each do |patient|
  puts patient.name
end
