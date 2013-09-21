class Purchase < ActiveRecord::Base
  belongs_to :transaction
  belongs_to :product

  def total
    product.price * quantity
  end

  def returnable?
    (transaction.date >= Date.today << 1) && !product.is_a?(Food)
  end
end
