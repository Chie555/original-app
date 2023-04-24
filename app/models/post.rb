class Post < ApplicationRecord
  validates :weight, presence: true, numericality: true
  validates :fat_percentage, numericality: true
  validates :image, presence: true
  # アソシエーション
  belongs_to :user
  # has_many :comments

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :today_id
end
