class ItemsController < ApplicationController
  before_action :move_to_signed_in, except: [:index]
  def index
  end
  def new
  end
  def create
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
    params.require(:item).permit(:image, :item_name, :info)
  end

end
