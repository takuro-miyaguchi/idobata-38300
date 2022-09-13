class Information < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category

  belongs_to :user
  has_many :favorites
  has_many :group_informations
  has_one_attached :image

  validates :title,       presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :image,       presence: true
  validates :subtitle,    presence: true
  validates :text,        presence: true
  validates :status,      presence: true
end
