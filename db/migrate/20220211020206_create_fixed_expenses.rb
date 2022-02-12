class CreateFixedExpenses < ActiveRecord::Migration[6.1]
  def change
    create_table :fixed_expenses do |t|
      t.string :description
      t.float :value

      t.timestamps
    end
  end
end
