include ActionView::Helpers::NumberHelper
class ProductServices
  def initialize(options = { product: nil, product_item: nil, markup_item: nil, parameter: nil, fixed_expense: nil} )
    @options = options
  end

  def calculate_cust_raw_material
    vr = 0
    @options[:product_item].each { | item | vr = vr +  item.raw_material.price * item.consumption }
    vr.round(2)
  end

  def calculate_production_day
     (60 / @options[:product].production_time) * @options[:parameter].hours_worked_day
  end

  def calculate_production_month
    calculate_production_day * @options[:parameter].worked_days_month
  end

  def calculate_man_power
    vr_m_o =  (@options[:parameter].pro_labore / calculate_production_month).round(4)
    number_with_precision(vr_m_o, :precision => 4).to_f
  end

  def calculate_fixed_expense_product
    total_fixed_expense = FixedExpenseServices.new(fixed_expenses: @options[:fixed_expense]).calculate_fixed_expense
    number_with_precision((total_fixed_expense / calculate_production_month), :precision => 4).to_f
  end

  def calculate_price_product
    cust_mp = calculate_cust_raw_material
    cust_mo = calculate_man_power
    cust_fixed_expense = calculate_fixed_expense_product
    markup_multiplicator = MarkupServices.new(markup_item: @options[:markup_item]).calculate_markup
    vr_custo = (cust_mp.to_f + cust_mo.to_f + cust_fixed_expense.to_f) * markup_multiplicator.to_f
    number_with_precision(vr_custo, :precision => 2).to_f
  end

end
