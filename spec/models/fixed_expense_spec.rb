require 'rails_helper'

RSpec.describe FixedExpense, type: :model do
  describe 'Fixed Expense' do
    it 'create' do
      fixed_expense = build(:fixed_expense)
      expect(fixed_expense.description).to eq('Energia')
      expect(fixed_expense.value).to eq(100.00)
    end
  end
end
