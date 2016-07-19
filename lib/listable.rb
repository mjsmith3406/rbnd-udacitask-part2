module Listable
  # Listable methods go here
  def format_description(description)
    "#{description}".ljust(30)
  end
  def one_date_format(options={})
    @due ? @due.strftime("%D") : "No due date"
  end
  def two_date_format(options={})
    dates = @start_date.strftime("%D") if @start_date
    dates << " -- " + @end_date.strftime("%D") if @end_date
    dates = "N/A" if !dates
    return dates
  end
  def set_priority(input, value)
    @items.find_index(input - 1)
    @priority = value
  end
  def format_date(kind, options={})
    return  one_date_format(options) if kind == :todo
    return  two_date_format(options) if kind == :event

  end
  def format_priority(priority)
    value = " ⇧".colorize(:red) if @priority == "high"
    value = " ⇨".colorize(:yellow) if @priority == "medium"
    value = " ⇩".colorize(:green) if @priority == "low"
    value = "" if !@priority
    return value
  end

end
