class Items
  attr_reader :description, :type

  def initialize(description, type)
    @description = description
    @type = type
  end
end
