class UdaciList
  attr_reader :title, :items

  def initialize(options={})
    @title = options[:title]
    @items = []
  end
  def add(type, description, options={})
    type = type.downcase
    @items.push TodoItem.new(description, options) if type == "todo"
    @items.push EventItem.new(description, options) if type == "event"
    @items.push LinkItem.new(description, options) if type == "link"
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
