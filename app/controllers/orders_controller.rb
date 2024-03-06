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
    params.permit(:price).merge(user_id: current_user.id)
  end

  def delivery_params
    params.require(:order).permit(:user_id, :item_id)
  end

end
