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

  def calculateProductionDay
   (60 / @product.production_time) * @parameter.hours_worked_day
  end

  def calculateProductionMonth
    calculateProductionDay * @parameter.worked_days_month
  end

  def calculateManPower
    '%.4f' % (@parameter.pro_labore / calculateProductionMonth).round(4)
  end

  def calculateFixedExpenseProduct
    total_fixed_expense = FixedExpenseServices.new(fixedExpenses: @fixed_expense).calculateFixedExpense
    '%.4f' % (total_fixed_expense / calculateProductionMonth)
  end

  def calculatePriceProduct
    cust_mp = calculateCustRawMaterial
    cust_mo = calculateManPower
    cust_fixed_expense = calculateFixedExpenseProduct
    markup_multiplicator = MarkupServices.new(markup_item: @markup_item).calculateMakup
    vr_custo = (cust_mp.to_f + cust_mo.to_f + cust_fixed_expense.to_f) * markup_multiplicator.to_f
    '%.2f' % vr_custo
  end

end
