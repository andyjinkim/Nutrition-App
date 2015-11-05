class FoodItem < ActiveRecord::Base
  belongs_to :user

  def date_consumed
     consumed_date.strftime("%A, %B %-d, %Y")
  end

end
