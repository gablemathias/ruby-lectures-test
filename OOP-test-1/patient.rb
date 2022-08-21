# Copyright (c) 2022 Gabriel Mathias "Gable" <gablemathias@icloud.com>
#
# Documentation by Gabriel Mathias
#
# All rights reserved. You can redistribute and/or modify it under the same terms as Ruby.
#
# Patient Class made for creating some patients to your amazing hospital or whatever
#
# LOOK this is just a comment practice at the top-level. Nothing more.

class Patient
  attr_reader :name

  def initialize(attributes = {})
    @name = attributes[:name]
    @cured = attributes[:cured] || false
  end

  def cured
    @cured = true
  end
end

patient = Patient.new(name: 'John', cured: true)

p patient
