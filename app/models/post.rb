class Post < ApplicationRecord
  validates :schedule_date, presence: true, numericality: true
  validates :weight, presence: true, numericality: true
  validates :fat_percentage, numericality: true

  # アソシエーション
  belongs_to :user
  # has_many :comments
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :today_id
end