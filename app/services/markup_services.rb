class MarkupServices
  def initialize (**options)
    options.each do |k, v|
      instance_variable_set("@#{k}", v) unless v.nil?
    end
  end

  def calculateMakup
    vr = 0
    @markup_item.each { | item | vr = vr + item.percentage }
    1 / ((100 - vr)/100)
  end
end
