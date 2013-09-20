class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :quantity
      t.belongs_to :transaction
      t.belongs_to :product
    end
  end
end
