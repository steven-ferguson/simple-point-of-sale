require 'spec_helper'

describe Alcohol do
  it 'checks if a person is 21' do 
    alcohol = Alcohol.new(:name => 'beer', price: 3.20)
    alcohol.can_purchase?('1988-04-11').should eq true
  end
end