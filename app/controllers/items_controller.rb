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
    #new画面で記入したデーターを保存する
    Item.create(item_params)
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

# def create
#   Comment.create(comment_params)
# end

# private
# def comment_params
#   params.require(:comment).permit(:text).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
# end