class CreateRawMaterials < ActiveRecord::Migration[6.1]
  def change
    create_table :raw_materials do |t|
      t.string :description
      t.string :unity
      t.float :price

      t.timestamps
    end
  end
end
