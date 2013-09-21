class Transaction < ActiveRecord::Base
  belongs_to :cashier
  has_many :purchases
  has_many :products, :through => :purchases

  def sum_purchases
    total_dollars = purchases.inject(0) { |total, purchase| total += purchase.total }
    update(:total => total_dollars)
    total_dollars
  end
end
