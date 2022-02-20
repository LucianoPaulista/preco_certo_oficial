class FixedExpenseServices
  def initialize(options = { fixed_expenses: nil })
    @options = options
  end

  def calculate_fixed_expense
    vr = 0
    @options[:fixed_expenses].each { | item | vr = vr + item.value }
    vr
  end
end
