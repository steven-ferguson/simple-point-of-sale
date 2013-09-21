require 'spec_helper'

describe Purchase do
  it { should belong_to :transaction }
  it { should belong_to :product }

  it 'returns its total' do
    product = Product.create(:name =>"Sandwich", :price => 2.50)
    purchase = product.purchases.create(:quantity => 3)
    purchase.total.should eq 7.5
  end

  it 'says if it is returnable if it was purchased within 30 days' do
    transaction = Transaction.create(:date => Date.today)
    product = Product.create(:type => 'Household')
    purchase = transaction.purchases.create(:product => product)
    purchase.returnable?.should be true
  end

  it 'says if it is returnable if it was purchased within 30 days' do
    transaction = Transaction.create(:date => Date.today << 3)
    product = Product.create(:type => 'Household')
    purchase = transaction.purchases.create(:product => product)
    purchase.returnable?.should be false
  end

  it 'is not returnable if it is food' do
    transaction = Transaction.create(:date => Date.today)
    product = Product.create(:type => 'Food')
    purchase = transaction.purchases.create(:product => product)
    purchase.returnable?.should be false
  end
end

