class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy
  has_many :items

  validates :customer_id, :address, :name, :shipping_cost,
            :payment_method, presence: true
  validates :postal_code, length: {is: 7}, numericality: { only_integer: true }

  enum payment_method: { クレジットカード: 0, 銀行振込: 1 }
  enum status: { 入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4 }

  def shipping_cost
    self.shipping_cost = 800
  end
end
