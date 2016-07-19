class UdaciList
  attr_reader :title, :items
  include Listable

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
      when "buy" then @items.push BuyItem.new(description)
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
    # puts "-" * @title.length unless
    # @title == nil
    # puts @title
    # puts "-" * @title.length unless
    # @title == nil
    # @items.each_with_index do |item, position|
    # puts "#{position + 1}) #{item.details}"
    # end
    puts_table(@title, make_row_array(@items))
  end
  def filter(type)
    filtered = @items.select { |item| item.type == type}
    if filtered <= 0
      puts "#{type} not found."
    else
      top ="#{@title} #{type}"
      puts_table(top, content_array(filtered))
    end
  end
  def puts_table(top, content_array)
    askii = Artii::Base.new(font: 'digital')
    puts askii.asciify(top)
    table = Terminal::Table.new rows: row_array
    puts table
  end
  def make_row_array(item_array)
    rows = []
    item_array.each_with_index do |item, position|
      row = item.details.insert(0, position + 1)
      rows << row
    end
    rows
  end
end
