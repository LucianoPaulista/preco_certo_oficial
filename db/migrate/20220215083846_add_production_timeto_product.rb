class AddProductionTimetoProduct < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :production_time, :float
  end
end
