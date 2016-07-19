class BuyItem
  include Listable
  attr_reader :description

  def initialize(description, options={})
    @type = "buy"
    @description = description
  end

  def details
    row = []
    row << format_description(@description)
  end
end
