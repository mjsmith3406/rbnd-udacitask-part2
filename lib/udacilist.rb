class UdaciList
  attr_reader :title, :items

  def initialize(options={})
    @title = options[:title]
    @items = []
  end

  def add(type, description, options={})
    type = type.downcase
    case type
      when "todo" then @items.push TodoItem.new(description, options)
      when "event" then @items.push EventItem.new(description, options)
      when "link" then @items.push LinkItem.new(description, options)
      else raise UdaciListErrors::InvalidItemType, "#{type} is invalid"
    end
  end
  def delete(index)
    if index > @items.length
    raise UdaciListErrors::IndexExceedsListSize
    else
    @items.delete_at(index - 1)
    end
  end
  def all
    puts "-" * @title.length unless
    @title == nil
    puts @title
    puts "-" * @title.length unless
    @title == nil
    @items.each_with_index do |item, position|
    puts "#{position + 1}) #{item.details}"
    end
    

  end
end
