class UsersController < ApplicationController

  def index
    @users = User.all
    # @Informations = current_user.like_informations() likeのindexaction
  end

  def new
    @information = Information.new()
  end

  def search
    if User.where(nickname: params[:search_word]).exists?
      @user = User.find_by(nickname: params[:search_word])
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
    # @user = params[:id] == "mypage"? current_user : User.find(params[:id])
    @informations = @user.informations.page(params[:page]).reverse_order
  end

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :prefecture_id, :municipality, :address, :latitude, :longitude)
  end
end
