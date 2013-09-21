require 'spec_helper'

describe Transaction do 
  it { should belong_to :cashier }
  it { should have_many(:products).through(:purchases) }

  it 'totals the purchases in the transaction' do 
    transaction = Transaction.create
    product = Product.create(:name =>"Sandwich", :price => 2.50)
    transaction.purchases.create(:product => product, :quantity => 3)
    product_b = Product.create(:name => 'b', :price => 10.00)
    transaction.purchases.create(:product => product_b, :quantity => 1)
    transaction.sum_purchases.should eq 17.50
  end

  it 'updates the total to the database when called' do
    transaction = Transaction.create
    product = Product.create(:name =>"Sandwich", :price => 2.50)
    transaction.purchases.create(:product => product, :quantity => 3)
    product_b = Product.create(:name => 'b', :price => 10.00)
    transaction.purchases.create(:product => product_b, :quantity => 1)
    transaction.sum_purchases
    Transaction.where(:total => 17.50).take.should eq transaction
  end
end

