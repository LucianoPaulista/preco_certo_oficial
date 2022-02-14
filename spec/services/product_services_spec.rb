require 'rails_helper'

RSpec.describe FixedExpense, type: :model do
  describe 'Fixed Expense' do
    it 'create' do
      product = create(:product, description: "Bolsa Farmacinha 19 x 25", unity: 'PÇ')
      raw_material = create(:raw_material, description: "Bagun Branco", unity: "ML", price: '18.00')
      product_item = create_list(:product_item, 10, component: 'Peça 1', consumption: 0.0100, raw_material_id: raw_material.id, product_id: product.id)

      expect(ProductServices.new(product_item: product_item).calculateCustRawMaterial).to eq(1.8)

    end
  end
end
