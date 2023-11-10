#!/C:/Ruby32-x64/bin/ruby.exe
require_relative 'app'

def print_menu
  options = ['Please choose an option by entering a number', '1. List all books', '2. List all people',
             '3. Create a person', '4. Create a book', '5. Create a rental', '6. List rentals for a person', '7. Exit']
  puts(options)
end

def process_choice(choice, app)
  case choice
  when 1 then app.list_all_books
  when 2 then app.list_all_people
  when 3 then create_person(app)
  when 4 then create_book(app)
  when 5 then create_rental(app)
  when 6 then list_rentals_for_person(app)
  when 7 then exit_application
  else invalid_option
  end
end

def create_person(app)
  print 'Enter name: '
  name = gets.chomp
  print 'Enter age: '
  age = gets.chomp.to_i
  print 'Enter type (student/teacher): '
  type = gets.chomp.downcase
  app.create_person(name, age, type)
end

def create_book(app)
  print 'Enter title: '
  title = gets.chomp
  print 'Enter author: '
  author = gets.chomp
  app.create_book(title, author)
end

def create_rental(app)
  print 'Enter person ID: '
  person_id = gets.chomp.to_i
  print 'Enter book title: '
  book_title = gets.chomp
  print 'Enter book author: '
  book_author = gets.chomp
  print 'Enter rental date (YYYY-MM-DD): '
  date = gets.chomp
  app.create_rental(person_id, book_title, book_author, Date.parse(date))
end

def list_rentals_for_person(app)
  print 'Enter person ID: '
  person_id = gets.chomp.to_i
  app.list_rentals_for_person(person_id)
end

def exit_application
  puts 'Exiting the app. Goodbye!'
end

def invalid_option
  puts 'Invalid option. Please choose a number between 1 and 7.'
end

def main
  app = App.new

  loop do
    print_menu
    print 'Choose an option (1-7): '
    choice = gets.chomp.to_i

    break if choice == 7

    process_choice(choice, app)
    puts "\n"
  end

  exit_application
end

main
