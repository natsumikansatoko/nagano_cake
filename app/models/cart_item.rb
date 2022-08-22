class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  validates :amout, numericality: { only_integer: ture }
end
