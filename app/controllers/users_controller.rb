class UsersController < ApplicationController

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
   end
  end

  def show
    # user = User.find(params[:id])
    # @nickname = current_user.nickname
    # @informations = current_user.informations
  end

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :prefecture_id, :municipality, :address, :latitude, :longitude)
  end
end
