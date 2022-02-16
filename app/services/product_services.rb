class ProductServices
  def initialize (**options)
    options.each do |k, v|
      instance_variable_set("@#{k}", v) unless v.nil?
    end
    @product_time = 0
  end

  def calculateCustRawMaterial
    vr = 0
    @product_item.each { | item | vr = vr +  item.raw_material.price * item.consumption }
    vr.round(2)
  end

  def calculateProductionDay
    @product_item = (60 / @product.production_time) * @paramater.workded_day
  end

  def calculateProductionMonth
    @product_item * @paramater.worked_day
  end

  pro_labore { 1200.00 }
  worked_days_month { 21 }
  hours_worked_day { 6 }


end
