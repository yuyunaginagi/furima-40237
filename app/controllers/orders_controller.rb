class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @item = Item.find_by(params[:id])
    @order_delivery = OrderDelivery.new

    if @item.user == current_user
      redirect_to root_path
      return
    end

    if @item.user != current_user && @item.sold_out?
      redirect_to root_path
      return
    end

  end

  def create
    @item = Item.find_by(params[:id])
    @order_delivery = OrderDelivery.new(order_params)
    if @order_delivery.valid?
      pay_item
      @order_delivery.save
      return redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end

  end

  private

  def order_params
    params.require(:order_delivery).permit(:order_id, :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    item = Item.find(order_params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def sold_out?
    order.present?
  end

end