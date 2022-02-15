class ProductServices
  def initialize (**options)
    options.each do |k, v|
      instance_variable_set("@#{k}", v) unless v.nil?
    end
  end

  def calculateCustRawMaterial
    vr = 0
    @product_item.each { | item | vr = vr +  item.raw_material.price * item.consumption }
    vr.round(2)
  end
end
