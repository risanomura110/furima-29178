class OrdersController < ApplicationController
  def index
     @order = Order.new
     @item = Item.find(params[:item_id])
  end

  def create
    # @order = Order.create(order_params)
  end
  private
  def order_params
    params.require(:order).permit(:price).merge(
      user_id: current_user.id,
      item_id: params[:item_id])
  end
end


# def create
#   @order = Order.new(price: order_params[:price])
#   if @order.valid?
#     pay_item
#     @order.save
#     return redirect_to root_path
#   else
#     render 'index'
#   end
# end


# private
# def order_params
#   params.require(:order).permit(:price, :token).merge(user_id: current_user.id, item_id: params[:item_id])
# end
# def pay_item
#   Payjp.api_key = "sk_test_31cc59f931886f079ce70fd8"
#   Payjp::Charge.create(
#     amount: order_params[:price],
#     card: order_params[:token],
#     currency:'jpy'
#   )
# end
