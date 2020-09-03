class ItemsController < ApplicationController
  before_action :move_to_signed_in, except: [:index]
  def index
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
  end

  def edit
  end

  def update
  end

  def show
  end

  private

  def move_to_signed_in
    redirect_to '/users/sign_in' unless user_signed_in?
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
