require_relative 'item'
class LocationsItem < Items
  include Listable
  attr_reader :description

  def initialize(description, options={})
    @type = "loacations"
    @description = description
  end

  def details
    row = []
    row << type + " " + format_description(@description)
  end
end
