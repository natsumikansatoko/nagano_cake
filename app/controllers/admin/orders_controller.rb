class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.page(params[:page]).per(10)
    @customer = Customer.find(params[:customer_id])
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
  end

  private
  def orders_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :status)
  end
end
