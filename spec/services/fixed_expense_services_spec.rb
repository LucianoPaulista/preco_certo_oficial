require 'rails_helper'

RSpec.describe FixedExpense, type: :model do
  describe 'Fixed Expense' do
    it 'create' do
      fixed_expenses = create_list(:fixed_expense, 10, description: "Energia", value: 100.00)
      expect(FixedExpenseServices.new( { fixed_expenses: fixed_expenses } ).calculate_fixed_expense).to eq(1000.00)
    end
  end
end
