class ProductItem < ApplicationRecord
  belongs_to :raw_material
  belongs_to :product
end
