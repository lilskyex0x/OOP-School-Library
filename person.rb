require_relative 'nameable'

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

  def rent_book(book_title, book_author, date)
    book = Book.new(book_title, book_author)
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

  class Book
    attr_accessor :title, :author
    attr_reader :rentals

    def initialize(title, author)
      @title = title
      @author = author
      @rentals = []
    end
  end

  class Rental
    attr_accessor :date
    attr_reader :person, :book

    def initialize(date, person, book)
      @date = date
      @person = person
      @book = book
      person.rentals << self
      book.rentals << self
    end
  end
end
