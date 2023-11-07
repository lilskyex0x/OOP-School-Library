require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(id, classroom, age = 0, name: "Unknown", parent_permission: true)
    super(id, age, name: name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\\_(ツ)_/¯"
  end
end
