class Nameable
  attr_reader :id

  def initialize(id)
    @id = id
  end

  def correct_name
    raise NotImplementedError, "The method 'correct_name' must be implemented in a subclass."
  end
end
