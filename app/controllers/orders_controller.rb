class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
  end

  def create
    @order = Order.create(order_params)
    Delivery.create(delivery_params)
    redirect_to root_path
  end

  private

  def order_params
    params.require(:order).permit(:user_id, :item_id)
  end

  def delivery_params
    params.permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(order_id: @order.id)
  end

end
