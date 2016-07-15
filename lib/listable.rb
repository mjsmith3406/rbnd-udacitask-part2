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
  def format_date(type, options={})
    return  one_date_format(options) if type == one_date
    return  two_date_format(options) if type == two_date

  end
  def format_priority(priority)
    value = " ⇧" if @priority == "high"
    value = " ⇨" if @priority == "medium"
    value = " ⇩" if @priority == "low"
    value = "" if !@priority
    return value
  end
end
