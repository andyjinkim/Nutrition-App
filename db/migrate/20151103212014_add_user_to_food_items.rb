class AddUserToFoodItems < ActiveRecord::Migration
  def change
    add_reference :food_items, :user, index: true
    add_foreign_key :food_items, :users
  end
end
