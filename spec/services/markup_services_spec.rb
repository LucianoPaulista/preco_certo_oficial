require 'rails_helper'

RSpec.describe FixedExpense, type: :model do
  describe 'Fixed Expense' do
    it 'create' do
      markup = create(:markup, description: "Venda pelo Mercado Livre")
      markup_item = create_list(:markup_item, 10, description: "Frete", percentage: 8.00, markup_id: markup.id)

      expect(MarkupServices.new( { markup_item: markup_item } ).calculate_markup).to eq(5.00)

    end
  end
end
