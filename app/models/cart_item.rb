class CartItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :variant
  before_create :set_data

  def soft_delete!
    soft_delete and save
  end

  def soft_delete
    self.status = 'deleted'
  end

  private

  def set_data
    v = variant
    self.status = 'added'
    self.name = v.name
    self.price = v.price
    self.savings_percentage = v.savings_percentage
    self.savings_amount = v.savings_amount
    self.sale_type = v.sale_type
  end
end
