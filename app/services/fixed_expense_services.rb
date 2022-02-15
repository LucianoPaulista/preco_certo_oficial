class FixedExpenseServices
  def initialize(**options)
    options.each do |k, v|
      instance_variable_set("@#{k}", v) unless v.nil?
    end
  end

  def calculateFixedExpense
    vr = 0
    @fixedExpenses.each { | item | vr = vr + item.value }
    vr
  end
end
