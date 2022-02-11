FactoryBot.define do
  factory :product_item do
    transient do
      raw_material { create(:raw_material) }
      product { create(:product) }
    end
    component { "Espelho da Bolsa" }
    consumption { 0.0530 }
  end
end
