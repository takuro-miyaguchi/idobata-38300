class UsersController < ApplicationController

  def search
    if User.where(nickname: params[:search_word]).exists?
      @user = User.find_by(nickname: params[:search_word])

      if current_user == @user
        @informations = @user.informations.page(params[:page]).reverse_order
      else
        @informations = @user.informations.where(status: 1).page(params[:page]).reverse_order
      end
    else
      redirect_to user_path("mypage")
    end
  end

  def edit
    @user = current_user
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
   end
  end

  def show
    if params[:id] == "mypage"
      @user = current_user
    else
      @user = User.find(params[:id])
    end

    unless current_user == @user || current_user.myfriend?(@user)
      redirect_to user_path("mypage")
    end

    if current_user == @user
      @informations = @user.informations.page(params[:page]).reverse_order
    else
      @informations = @user.informations.where(status: 1).page(params[:page]).reverse_order
    end
  end

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :prefecture_id, :municipality, :address, :latitude, :longitude)
  end
end
