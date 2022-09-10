class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.where(customer: current_customer)
    @customer = Customer.find(current_customer.id)
  end

  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_items_params)
      redirect_to cart_items_path
    else
      redirect_to cart_items_path
    end
  end

  def delete
    @cart_item = CartItem.find(params[:id])
    @cart_item.delete
    redirect_to cart_items_path
  end

  def delete_all
    @cart_items = current_customer.cart_items
    @cart_items.delete_all
    redirect_to cart_items_path
  end

  def create
    @cart_item_check = CartItem.find_by(customer_id: current_customer.id, item_id: params[:cart_item][:item_id])
    if @cart_item_check
      @cart_item_check.amount += params[:cart_item][:amount].to_i
      @cart_item_check.save
      redirect_to cart_items_path
    else
      @cart_item = CartItem.new(cart_items_params)
      @cart_item.customer_id = current_customer.id
      if @cart_item.save
        redirect_to cart_items_path
      else
        render ("items/show")
      end
    end
  end

  private
  def cart_items_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end
end
