class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    unless @item.order.nil?
      # order.item_idがあったら(購入済)ならrootにリダイレクトする
      redirect_to root_path
    end
    root_move
    @orderadd = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @orderadd = OrderAddress.new(
      postal: order_params[:postal],
      prefecture_id: order_params[:prefecture_id],
      city: order_params[:city],
      add: order_params[:add],
      building: order_params[:building],
      phone: order_params[:phone],
      user_id: current_user.id,
      item_id: @item.id
    )
    if @orderadd.valid?
      pay_item
      @orderadd.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def root_move
    # 出品者が購入ページに遷移するとトップページに遷移する
    redirect_to root_path if @item.user.id == current_user.id
  end

  def order_params
    params.permit(:token, :postal, :prefecture_id,
                  :city, :add, :building, :phone).merge(
                    user_id: current_user.id,
                    item_id: @item.id
                  )
  end

  def pay_item
    # 支払情報を生成する
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
