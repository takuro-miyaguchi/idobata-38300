class FriendsController < ApplicationController
  # フォロー申請するとき status: 0
  def create
    current_user.follow(params[:user_id])
    redirect_to request.referer
  end
  # フォロー承認するとき status: 1
  def update
    current_user.approve(params[:user_id])
    redirect_to request.referer
  end
  # フォロー外すとき
  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end
  def index
    # byebug
    user = User.find(params[:id])
    # # 申請中リスト
    @applied_friends = user.applied_friends()
    @apply_friends = user.apply_friends()
    # # 友達リスト
    @myfriend_users = user.myfriend_users
  end
  # # フォロー一覧
  # def followings
  #   user = User.find(params[:user_id])
  #   @users = user.followings
  # end
  # # フォロワー一覧
  # def followers
  #   user = User.find(params[:user_id])
  #   @users = user.followers
  # end
end
