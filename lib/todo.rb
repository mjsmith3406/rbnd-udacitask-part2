class TodoItem
   include Listable
  attr_reader :description, :due, :priority
  def initialize(description, options={})
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
    format_description(@description) + "due: " +
    format_date(:todo) +
    format_priority(priority)
  end
end
