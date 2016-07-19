class LinkItem
   include Listable
  attr_reader :description, :site_name

  def initialize(url, options={})
    @type = "link"
    @description = url
    @site_name = options[:site_name]
  end
  def format_name
    @site_name ? @site_name : ""
  end
  def details
     row = []
     row << format_description(@description)
     row << "site name: " + format_name
  end
end
