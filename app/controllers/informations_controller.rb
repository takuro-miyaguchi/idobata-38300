class InformationsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_information, only: [:edit, :show]

  def index
  end

  def new
    @information = Information.new
  end

  def create
    @information = Information.new(information_params)
    if @information.save
      redirect_to user_path("mypage")
    else
      render :new
    end
  end

  def destroy
    information = Information.find(params[:id])
    if information.user == current_user
      information.destroy
    end
    redirect_to user_path("mypage")
  end

  def edit
    unless information.user == current_user
      redirect_to user_path("mypage")
    end
  end

  def update
    information = Information.find(params[:id])
    if information.user == current_user
      information.update(information_params)
    end
    redirect_to information_path(information)
  end

  def show
    # フレンドか判定
    # if current_user.friends.find_by(information.user).status == 0
    #   redirect_to user_path("mypage")
    # end
    unless current_user == @information.user || current_user.myfriend?(@information.user)
      redirect_to user_path("mypage")
    end
    # # params
    # # params[:user_id]
    # @information = Information.find(34)
    # @information = Information.find_by(title: "gtkww")
  end

  private
  def information_params
    data = params.require(:information).permit(:title, :category, :text, :status, images: []).merge(user_id: current_user.id)
    data[:category] = data[:category].to_i
    return data
  end

  def set_information
    @information = Information.find(params[:id])
  end
end
