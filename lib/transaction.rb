class Transaction < ActiveRecord::Base
  belongs_to :cashier
  has_many :purchases
  has_many :products, :through => :purchases

  def total
    purchases.inject(0) { |total, purchase| total += purchase.total }
  end
end
