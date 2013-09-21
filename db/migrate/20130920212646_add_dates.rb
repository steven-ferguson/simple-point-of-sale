require './lib/cashier'
require './lib/product'
require './lib/transaction'
require './lib/purchase'

class AddDates < ActiveRecord::Migration
  def change
    Transaction.all.each do |transaction|
      transaction.update(:date => Date.today)
    end
  end
end
