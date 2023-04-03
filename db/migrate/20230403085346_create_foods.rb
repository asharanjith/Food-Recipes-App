class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :measurement_unit
      t.string :price
      t.integer :quantity, default: 0

      t.timestamps
    end
  end
end
