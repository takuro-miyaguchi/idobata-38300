class FavoritesController < ApplicationController
  def index
    @user = current_user
    @favorites = @user.favorites.page(params[:page]).reverse_order
  end

  def create
    @information_favorite = Favorite.new(user_id: current_user.id, information_id: params[:information_id])
    @information_favorite.save
    redirect_to information_path(params[:information_id])
  end

  def destroy
    @information_favorite = Favorite.find_by(user_id: current_user.id, information_id: params[:information_id])
    @information_favorite.destroy
    redirect_to information_path(params[:information_id])
  end
end
