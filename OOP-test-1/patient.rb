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
  attr_reader :name, :cured
  attr_accessor :room, :id

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @cured = attributes[:cured] || false
  end

  def cured?
    @cured = true
  end
end
