module Public::CartItemsHelper
  def subtotal(cart_item)
    cart_item.item.with_tax_price * cart_item.amount
  end
end
