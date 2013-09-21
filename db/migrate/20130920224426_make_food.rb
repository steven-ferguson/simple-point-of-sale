require './lib/cashier'
require './lib/product'
require './lib/transaction'
require './lib/purchase'

class MakeFood < ActiveRecord::Migration
  def change
    Product.all.each do |product|
      product.update(:type => 'food')
    end
  end
end
