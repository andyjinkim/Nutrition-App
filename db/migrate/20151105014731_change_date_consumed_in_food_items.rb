class ChangeDateConsumedInFoodItems < ActiveRecord::Migration
  def change
    change_column :food_items, :consumed_date, :date
  end
end
