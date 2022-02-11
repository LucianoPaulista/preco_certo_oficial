require 'rails_helper'

RSpec.describe ProductItem, type: :model do
  describe 'ProductItem' do
    it 'create' do
      productItem = build(:product_item)
      expect(productItem.component).to eq('Espelho da Bolsa')
      expect(productItem.consumption).to eq(0.0530)
    end
  end
end
