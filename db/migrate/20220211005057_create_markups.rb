class CreateMarkups < ActiveRecord::Migration[6.1]
  def change
    create_table :markups do |t|
      t.string :description

      t.timestamps
    end
  end
end
