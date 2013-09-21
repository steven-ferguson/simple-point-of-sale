class Product < ActiveRecord::Base
  has_many :purchases

  def returnable?
    !self.is_a?(Food)
  end
end
