class ItemsController < ApplicationController
  before_action :move_to_signed_in, except: [:index, :show]
  before_action :item_find, except: [:index, :new, :create]
  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to action: 'index'
    else
      render :new
   end
  end

  def destroy
    if @item.destroy
      redirect_to action: 'index'
    else
      render :show
   end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to action: 'index'
    else
      render :edit
   end
  end

  def show
    # 写真をクリックした先のページitem_pathで移動できる
  end

  private

  def move_to_signed_in
    redirect_to '/users/sign_in' unless user_signed_in?
  end

  def item_find
    @item = Item.find(params[:id])
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
      :schedule_id
    )
          .merge(user_id: current_user.id)
  end
end
