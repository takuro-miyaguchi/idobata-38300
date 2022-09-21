class InformationsController < ApplicationController
  # before_action :set_information, only: [:edit, :show]

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
    information.destroy
  end

  def edit
    @information = Information.find(params[:id])
  end

  def update
    information = Information.find(params[:id])
    information.update(information_params)
    redirect_to information_path(information)
  end

  def show
    # # params
    # # params[:user_id]
    @information = Information.find(params[:id])
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
