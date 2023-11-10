require_relative 'nameable'
require_relative 'book'
require_relative 'rental'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id, :rentals

  def initialize(id, age = 0, name: 'Unknown', parent_permission: true)
    super(id)
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def rent_book(book, date)
    rental = Rental.new(date, self, book)
    @rentals << rental
    rental
  end

  def of_age?
    @age >= 18
  end

  def correct_name
    @name
  end
end
