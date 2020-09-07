class OrdersController < ApplicationController
  def index
     @item = Item.find(params[:item_id])
  end

  def create
  
    @item = Item.find(params[:item_id])
    #@item.priceのデーターを持ってくるために定義する
    @order = Order.new(price: @item.price)
    # 値段を取得したかったら@order.price="1000"
   if @order.valid?
     pay_item
     @order.save
     return redirect_to root_path
   else
     render 'index'
   end
  end
  private
  def order_params
    params.require(:order).permit(:price, :token).merge(
      user_id: current_user.id,
      item_id: params[:item_id])
  end
end
def pay_item
  # 支払機能を利用する
  Payjp.api_key = "sk_test_31cc59f931886f079ce70fd8"
  Payjp::Charge.create(
    amount: @item.price,
    card: order_params[:token],
    currency:'jpy'
  )
end
