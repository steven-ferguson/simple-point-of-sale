class AddTransactionTotal < ActiveRecord::Migration
  def change
    add_column :transactions, :total,  :decimal
  end
end
