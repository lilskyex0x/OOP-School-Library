require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'decorator'
require_relative 'nameable'

person = Person.new(22, 25, name: 'stickerman', parent_permission: true)
person.correct_name

capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name

capitalized_trimmed_person = CapitalizeDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name

person = Person.new(21, 23, name: 'john wick', parent_permission: true)
puts "Original Name: #{person.correct_name}"

capitalized_person = CapitalizeDecorator.new(person)
puts "Capitalized Name: #{capitalized_person.correct_name}"

capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts "Capitalized and Trimmed Name: #{capitalized_trimmed_person.correct_name}"

person2 = Person.new(23, 40, name: 'Sombra', parent_permission: true)
puts "Original Name (Person 2): #{person2.correct_name}"

capitalize_person2 = CapitalizeDecorator.new(person2)
puts "Capitalized Name (Person 2): #{capitalize_person2.correct_name}"
