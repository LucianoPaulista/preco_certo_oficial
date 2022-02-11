class CreateParameters < ActiveRecord::Migration[6.1]
  def change
    create_table :parameters do |t|
      t.float :pro_labore
      t.integer :worked_days_month
      t.float :hours_worked_day

      t.timestamps
    end
  end
end
