require_relative 'item'
class TodoItem < Items
   include Listable
  attr_reader :description, :due, :priority
  def initialize(description, options={})
    @type = "todo"
    @priority_array = ["low", "medium", "high"]
    @description = description
    @due = options[:due] ? Chronic.parse(options[:due]) : options[:due]
    @priority = options[:priority]
    if @priority
      unless @priority_array.include? @priority
        raise UdaciListErrors::InvalidPriorityValue, "#{@priority}, not correct"
      end
    end
  end

  def details
    row = []
    row << format_description(@description)
    row << "due: " + format_date(:one_date, date: @due) + format_priority(@priority)
  end
end
