class Purchase < ActiveRecord::Base
  belongs_to :transaction
  belongs_to :product

  def total
    product.price * quantity
  end
end
