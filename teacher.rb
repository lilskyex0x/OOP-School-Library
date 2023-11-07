require_relative 'person'

class Teacher < Person
  attr_reader :specialization

  def initialize(id, specialization, age = 0, name: 'Unknown', parent_permission: true)
    super(id, age, name: name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
