class OrdersController < ApplicationController
  def index
     @item = Item.find(params[:item_id])
     @orderadd = OrderAddress.new
  end
  def create
    @item = Item.find(params[:item_id])
    @orderadd = OrderAddress.new(order_params)
     binding.pry
   if @orderadd.valid?
    binding.pry
     pay_item
      @orderadd.save
     return redirect_to root_path
   else
     render 'index'
    binding.pry
   end

  end
  private
  def order_params
    params.permit(:token, :postal, :prefecture_id, 
      :city, :add, :building,:phone).merge(
      user_id: current_user.id,
      item_id: @item.id )
  end
  
  def pay_item
  # 支払情報を生成する
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  Payjp::Charge.create(
    amount: @item.price,
    card: order_params[:token],
    currency:'jpy'
  )
  end
end