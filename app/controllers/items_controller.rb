class ItemsController < ApplicationController
  before_action :move_to_signed_in, except: [:index]
  def index
    # トップページ生成
  end
  def new
    # 出品するため商品の情報を登録する記入する画面生成
    @item = Item.new
  end
  def create
    @item= Item.new(item_params)
     if @item.save
      redirect_to action: 'index'
    else
      render :new
    end
  end
  def destroy
  end
  def edit
  end
  def update
  end
  def show
  end
  private
  def move_to_signed_in
    unless user_signed_in?
      #サインインしていないユーザーはログインページが表示される
      redirect_to  '/users/sign_in'
    end
  end
  def item_params
    params.require(:item).permit(
      :image, 
      :item_name,
      :info,
      :price,
      :category_id,
      :status_id, 
      :shipping_id,
      :area_id,
      :schedule_id, )
      .merge(user_id: current_user.id)
  end
end