require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(id, age = 0, name: 'Unknown', parent_permission: true, classroom: nil)
    super(id, age, name: name, parent_permission: parent_permission)
    self.classroom = classroom if classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\\_(ツ)_/¯'
  end
end
