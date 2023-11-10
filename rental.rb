class Rental
  attr_accessor :date, :book, :rentals
  attr_reader :person

  def initialize(date, person, book)
    @date = date
    @person = person
    @book = book
    person.rentals << self
    book.rentals << self
  end
end
