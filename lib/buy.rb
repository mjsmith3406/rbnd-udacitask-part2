class Buy
  include Listable
  attr_reader :type, :description

  def initialize(description)
    @type = type
    @description = description
  end

  def details
    format_description(@description)
  end
end
