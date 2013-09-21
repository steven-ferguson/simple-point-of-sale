require './lib/cashier'
require './lib/product'
require './lib/transaction'
require './lib/purchase'

class TotalTransactions < ActiveRecord::Migration
  def change
    Transaction.all.each do |transaction| 
      if transaction.purchases.length > 0
        transaction.sum_purchases
      else
        transaction.update(:total => 0)
      end
    end
  end
end
