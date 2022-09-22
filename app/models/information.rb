class Information < ApplicationRecord

  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :group_informations
  has_many_attached :images

  def favorited?(user)
    favorites.where(user_id: user.id).exists?
  end

  enum category: {幼稚園・保育園:0, 学校:1, 習い事:2, 店舗:3, 施設:4, 病院:5, 理髪店・美容室:6, サービス:7, その他:8 }

  validates :title,       presence: true
  validates :category,    presence: true
  # validates :image,       presence: true
  validates :text,        presence: true
  validates :status,      presence: true
end
