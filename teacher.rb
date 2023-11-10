require_relative 'person'

class Teacher < Person
  attr_reader :specialization

  def initialize(id, age = 0, name: 'Unknown', parent_permission: true, specialization: nil)
    super(id, age, name: name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
