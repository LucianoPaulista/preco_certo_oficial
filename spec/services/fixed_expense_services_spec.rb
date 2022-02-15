require 'rails_helper'

RSpec.describe FixedExpense, type: :model do
  describe 'Fixed Expense' do
    it 'create' do
      fixedExpenses = create_list(:fixed_expense, 10, description: "Energia", value: 100.00)
      expect(FixedExpenseServices.new(fixedExpenses: fixedExpenses).calculateFixedExpense).to eq(1000.00)
    end
  end
end
