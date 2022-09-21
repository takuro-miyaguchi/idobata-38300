class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :informations, dependent: :destroy
  has_many :friends
  has_many :favorites
  has_many :group_users

  # フォローをした、されたの関係
  has_many :friends, class_name: "Friend", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_friends, class_name: "Friend", foreign_key: "followee_id", dependent: :destroy

  # 一覧画面で使う
  has_many :followings, through: :friends, source: :followee
  has_many :followers, through: :reverse_of_friends, source: :follower

  validates :nickname, presence: true
  # validates :nickname, presence: true, uniquness: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :municipality, presence: true
  validates :address, presence: true
  # validates :latitude, presence: true
  # validates :longitude, presence: true

  def applied_friends()
    reverse_of_friends.where(status: 0)
  end

  def apply_friends()
    friends.where(status: 0)
  end

  def myfriend_users()
    users = []
    friends.where(status: 1).each do |friend|
      users << friend.followee
    end
    reverse_of_friends.where(status: 1).each do |friend|
      users << friend.follower
    end
    return users
  end

  def like_informations()
    informations = []
    favorites.each do |favorite|
      informations << favorite.information
    end
    return informations
  end

  # フォロー申請したときの処理
  def follow(user_id)
    friends.create(status: 0,followee_id: user_id)
  end
  # フォロー承認したときの処理
  def approve(user_id)
    friends.find_by(follower_id: user_id).update(status: 1)
  end
  # フォローを外すときの処理
  def unfollow(user_id)
    friends.find_by(followee_id: user_id).destroy if followings.exists?
    friends.find_by(follower_id: user_id).destroy if followers.exists?
  end
  # フォローしているか判定
  def following?(user)
    followings.include?(user)
  end

  # 承認しているか判定
  def apply?(user)
    if followers.include?(user)
      return friends.find_by(follower_id: user.id).status
    end
    return -1
  end

end
