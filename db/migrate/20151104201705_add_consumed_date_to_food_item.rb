class AddConsumedDateToFoodItem < ActiveRecord::Migration
  def change
    add_column :food_items, :consumed_date, :datetime
  end
end
