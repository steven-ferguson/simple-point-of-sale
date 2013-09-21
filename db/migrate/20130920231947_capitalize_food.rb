require './lib/cashier'
require './lib/product'
require './lib/transaction'
require './lib/purchase'
require './lib/alcohol'

class CapitalizeFood < ActiveRecord::Migration
  def change
    rename_column :products, :type, :type_of_product
    Product.where(:type_of_product => 'food').each {|product| product.update(:type_of_product => 'Food')}
    rename_column :products, :type_of_product, :type
  end
end
