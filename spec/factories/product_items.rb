FactoryBot.define do
  factory :product_item do
    component { "Espelho da Bolsa" }
    consumption { 0.0530 }
    association :raw_material
    association :product
  end
end
