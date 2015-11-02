class CreateFoodItems < ActiveRecord::Migration
  def change
    create_table :food_items do |t|
      t.string :name
      t.integer :calories
      t.integer :sugar
      t.integer :sodium
      t.integer :protein

      t.timestamps null: false
    end
  end
end
