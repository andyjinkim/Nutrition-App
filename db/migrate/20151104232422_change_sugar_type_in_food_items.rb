class ChangeSugarTypeInFoodItems < ActiveRecord::Migration
  def change
    change_column :food_items, :sugar, :float
    change_column :food_items, :sodium, :float
    change_column :food_items, :protein, :float
  end
end
