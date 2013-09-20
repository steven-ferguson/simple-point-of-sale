require 'spec_helper'

describe Purchase do
  it { should belong_to :transaction }
  it { should belong_to :product }

  it 'returns its total' do
    product = Product.create(:name =>"Sandwich", :price => 2.50)
    purchase = product.purchases.create(:quantity => 3)
    purchase.total.should eq 7.5
  end
end

