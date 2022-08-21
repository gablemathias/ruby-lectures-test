class Patient

  def initialize(attributes={})
    @name = attributes[:name]
    @cured = attributes[:cured] || false
  end

  def cured
    @cured = true
  end

end

patient = Patient.new(name: 'John', cured: true)

p patient
