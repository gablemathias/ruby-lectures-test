require_relative './patient'

class Room
  attr_reader :patients

  class FullRoom < StandardError; end

  def initialize(attributes = {})
    @capacity = attributes[:capacity]
    @patients = attributes[:patients] || []
  end

  def add(patient)
    raise FullRoom, 'The room is full!' if full?

    patient.room = self
    @patients << patient
  end

  def full?
    @capacity == @patients.length
  end
end

room = Room.new(capacity: 2)

p room

sarah = Patient.new(name: 'Sarah')
room.add(sarah)

puts 'Is the room full?'
puts room.full?
puts '---------'

john = Patient.new(name: 'John', cured: true)

room.add(john)

puts 'Is the room full?'
puts room.full?
puts '---------'

carlos = Patient.new(name: 'Carlos')

room.add(carlos)

room.patients.each do |patient|
  puts patient.name
end

p room

lucas = Patient.new(name: 'Lucas')

room2 = Room.new(capacity: 3)

room2.add(lucas)

p room2
  