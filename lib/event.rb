require_relative 'item'
class EventItem < Items
  include Listable
  attr_reader :description, :start_date, :end_date

  def initialize(description, options={})
    @type = "event"
    @description = description
    @start_date = Date.parse(options[:start_date]) if options[:start_date]
    @end_date = Date.parse(options[:end_date]) if options[:end_date]
  end

  def details
    row = []
    row << type + " " + format_description(@description)
    row << "event dates: " + format_date(:two_date, start_date: @start_date, end_date: @end_date)
  end
end
