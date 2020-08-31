class UsersController < ApplicationController
  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end
end
