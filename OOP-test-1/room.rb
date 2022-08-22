require_relative './patient'

class Room
  attr_reader :patients
  attr_accessor :id

  class FullRoom < StandardError; end

  def initialize(attributes = {})
    @id = attributes[:id]
    @capacity = attributes[:capacity] || 0
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
