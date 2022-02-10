require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Product' do
    it 'create' do
      product = build(:product)
      expect(product.description).to eq('Necessaire Farmacinha 19 x 25')
      expect(product.unity).to eq('PÇ')
    end
  end
end
