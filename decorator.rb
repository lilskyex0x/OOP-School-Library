require_relative 'nameable'

class Decorator < Nameable
    
    def initialize(nameable)
        @nameable = nameable
    end

    def correct_name
        @nameable.correct_name
    end

end

class CapitalizeDecorator < Decorator
    def correct_name
        super.capitalize
    end
end

class TrimmerDecorator < Decorator
    def correct_name
        name = super
        name.length > 10 ? name[0...10] : name
    end
end