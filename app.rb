require_relative 'student'
require_relative 'teacher'
require_relative 'person'
require_relative 'book'
require_relative 'rental'

class App
  attr_reader :people, :books, :rentals

  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def list_all_books
    if @books.empty?
      puts 'No books available.'
    else
      puts 'List of all books:'
      @books.each { |book| puts "#{book.title} by #{book.author}" }
    end
  end

  def list_all_people
    puts 'List of all people:'
    @people.each { |person| puts "#{person.name} (ID: #{person.id})" }
  end

  def create_person(name, age, type, parent_permission: true, specialization: nil)
    id = @people.length + 1
    if type == 'student'
      person = Student.new(id, age, name: name, parent_permission: parent_permission)
    elsif type == 'teacher'
      person = Teacher.new(id, age, name: name, specialization: specialization)
    else
      puts 'Invalid person type.'
      return
    end

    @people << person
    puts "#{person.name} (ID: #{person.id}) has been created."
    person
  end

  def create_book(title, author)
    book = Book.new(title, author)
    @books << book
    puts "#{book.title} by #{book.author} has been created."
    book
  end

  def create_rental(person_id, book_title, book_author, date)
    person = @people.find { |p| p.id == person_id }
    book = @books.find { |b| b.title == book_title && b.author == book_author }

    if person && book
      rental = Rental.new(date, person, book)
      @rentals << rental
      puts "#{person.name} (ID: #{person.id}) has rented #{book.title} by #{book.author} on #{date}."
      rental
    else
      puts 'Person or book not found.'
    end
  end

  def list_rentals_for_person(person_id)
    person = @people.find { |p| p.id == person_id }

    if person
      puts "Rentals for #{person.name} (ID: #{person.id}):"
      person.rentals.each do |rental|
        puts "#{rental.book.title} by #{rental.book.author} on #{rental.date}"
      end
    else
      puts 'Person not found.'
    end
  end
end
