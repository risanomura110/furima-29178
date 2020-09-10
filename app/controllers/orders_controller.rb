class OrdersController < ApplicationController
  before_action :item_find
  before_action :move_to_unsign


  # heroku config:set PAYJP_SECRET_KEY="sk_test_31cc59f931886f079ce70fd8"
  # heroku config:set PAYJP_PUBLIC_KEY="pk_test_3f766a0e726df49d8edb8bc7"
pk_test_3f766a0e726df49d8edb8bc7
  def index
    unless @item.order.nil?
      # order.item_idがあったら(購入済)ならrootにリダイレクトする
      redirect_to root_path
    end
    root_move
    @orderadd = OrderAddress.new
  end

  def create
    @orderadd = OrderAddress.new(order_params)
    if @orderadd.valid?
      pay_item
      @orderadd.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def item_find
    @item = Item.find(params[:item_id])
  end

  def root_move
    # 出品者が購入ページに遷移するとトップページに遷移する
    redirect_to root_path if @item.user.id == current_user.id
  end

  def move_to_unsign
    # ログインしていないユーザーが購入ページに遷移するとトップページに遷移する
    unless user_signed_in?
    redirect_to root_path 
    end
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
