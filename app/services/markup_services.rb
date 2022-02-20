class MarkupServices
  def initialize (options = { markup_item: nil })
    @options = options
  end

  def calculate_markup
    vr = 0
    @options[:markup_item].each { | item | vr = vr + item.percentage }
    1 / ((100 - vr)/100)
  end
end
