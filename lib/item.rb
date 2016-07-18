class Item
  attr_reader :description, :item

  def initialize(description, type)
    @type = type
    @description = description
  end

end
